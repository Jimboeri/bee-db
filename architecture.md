# Bee-DB Django architecture

## Top-level layout

- **Project:** [bee/bee/](bee/bee/) (Django settings, root URLconf, ASGI/WSGI). `ROOT_URLCONF = "bee.urls"` mounts everything under `/beedb/`.
- **Single app:** `beedb` ([bee/beedb/](bee/beedb/)) — there is no per-feature app split. ~3,000 lines of Python across `views.py`, `forms.py`, `models.py`, `background.py`.
- **Two Python processes** share the same Postgres DB:
  1. `web` — standard Django (`runserver` or `gunicorn`), built from [Dockerfile](Dockerfile).
  2. `background` — long-running script [bee/beedb/background.py](bee/beedb/background.py) bootstrapped with `django.setup()`, built from [script-dockerfile](script-dockerfile). It owns all outbound email and time-based scheduling.

## Models ([bee/beedb/models.py](bee/beedb/models.py))

Ownership chain: `User → Apiary → Colony → Inspection`. Profile is created automatically.

| Model | Role |
|---|---|
| [Apiary](bee/beedb/models.py#L52) | Beekeeper's site; lat/long drive hemisphere-aware season detection. |
| [Profile](bee/beedb/models.py#L78) | Extends `User`. Holds inspection cadence per season and comms prefs. Auto-created via [`post_save` receiver](bee/beedb/models.py#L121). |
| [Colony](bee/beedb/models.py#L127) | A hive. Status: Current/Dead/Absconded/Sold/Combined. Helpers `lastInspection()`, `diaryDue()`, `diaryDueNew()`. |
| [Inspection](bee/beedb/models.py#L193) | Hive inspection with eggs/varroa/weight/disease/temper scores. [`healthScore()`](bee/beedb/models.py#L305) is the canonical hive-health formula. |
| [Diary](bee/beedb/models.py#L406) | Per-colony reminders with `dueDt`/`notifyDt`/`completed`. |
| [Treatment / TreatmentType](bee/beedb/models.py#L502-L545) | Varroa treatments with pre/post counts. |
| [Transfer](bee/beedb/models.py#L342) | Buy/sell/swarm/split/new colony event records. |
| [Audit](bee/beedb/models.py#L373) | Append-only log of colony lifecycle (codes 1–8 documented in the docstring). |
| [Message](bee/beedb/models.py#L442) | **Outbox table** — views/signals insert rows; background process drains them. |
| [Config](bee/beedb/models.py#L432) | KV store for cross-process scheduling state (`lstDaily`, `lstWeekly`, `commsWeeklyDay`). |
| [SizeChoice](bee/beedb/models.py#L563) | DB-driven display text for Inspection counts/weight, reloaded from `sizeChoice.json` on every background restart. |
| [Feedback](bee/beedb/models.py#L454) | User-submitted bug/feature/suggestion items. |
| [Picture](bee/beedb/models.py#L592) | Image upload routed by [`user_directory()`](bee/beedb/models.py#L576) under `MEDIA_ROOT/images/<beek>/<apiary>/<colony>/...`. |

## Views (43 view functions, all FBV)

Split across four modules — no class-based views, no DRF ViewSets.

- **[views.py](bee/beedb/views.py) (1196 lines)** — CRUD for apiary/colony/inspection/diary/treatment, plus colony lifecycle workflows (split, combine across two steps `colCombine1`→`colCombine2`, transfer, move between apiaries, mark dead), reports (`colReport`, `apReport`, `purchSales`), and auth (`signup` + `activate_account` with token-based email activation).
- **[profile.py](bee/beedb/profile.py)** — profile, inspection prefs, comms prefs (3× detail/mod pairs).
- **[adminViews.py](bee/beedb/adminViews.py)** — `admin_menu`, `admBeekeepers` (custom admin pages distinct from Django admin).
- **[apiViews.py](bee/beedb/apiViews.py)** — DRF `@api_view` functions for `TreatmentType` lookups (list, by id, by name). Auth-gated by `request.user.is_authenticated` rather than DRF permission classes.

## URL structure

Everything is under `/beedb/` ([bee/beedb/urls.py](bee/beedb/urls.py)), grouped:

```
/beedb/                            index
/beedb/apiary/{add,modify/<id>,<id>,photoAdd/<id>}
/beedb/colony/{add,modify,<id>,moveChoose,moveSelect,transfer,split,combine,combine1,combine2,dead,adddiary,photoAdd}
/beedb/inspection/{add,modify,del,<id>}
/beedb/diary/{<id>,modify,complete}
/beedb/treatment/{add,<id>,modify,complete}
/beedb/profile/, /beedb/inspectPref{Detail,Mod}/, /beedb/commsPref{Detail,Mod}/, /beedb/passwordMod/
/beedb/reports/, /beedb/purch/, /beedb/{col,ap}Report{,Choose}/
/beedb/fb{Index,Add,View,Mod}/     feedback
/beedb/adminIndex/, /beedb/adminBeekeepers/
/beedb/login,signup,logout,activate,password-reset/...
/beedb/api/treatmentType/{,/view/<id>,/viewByName/}
/admin/                            Django admin (root URLconf)
```

Auth uses Django's built-in `auth_views.PasswordChangeView`/`PasswordResetView` family rebound to custom templates under `templates/accounts/`.

## Forms

26 form classes in [forms.py](bee/beedb/forms.py) — mix of `ModelForm` (most CRUD) and plain `Form` (multi-step flows like `ColonyAddForm`, `SwarmForm`, `PurchaseForm`, `InspectionOptionsForm`, and report parameter pickers). `CustomUserCreationForm` is a hand-rolled signup form (not Django's built-in).

## Background process ([background.py](bee/beedb/background.py))

A single `while True` loop:

1. Every second: drain unprocessed `Message` rows via [`sendMessage()`](bee/beedb/background.py#L119), which builds an Apprise `mailtos://` URL.
2. Every 15 seconds: call [`checkIfWeeklyReminders()`](bee/beedb/background.py#L366) (gated on `Config.commsWeeklyDay` + `lstWeekly`).
3. On hour rollover: [`procHourlyDiary()`](bee/beedb/background.py#L239) — emails each user whose colonies have newly-overdue diary entries, then stamps `Diary.notifyDt`.
4. On startup: [`check_config()`](bee/beedb/background.py#L63) seeds Config keys, [`loadSizeChoices()`](bee/beedb/background.py#L96) upserts from `sizeChoice.json`.

Hemisphere logic lives in [`seasonCheck(latitude, dt)`](bee/beedb/background.py#L167) — used by [`currentInspectionCycle()`](bee/beedb/background.py#L206) which picks the user's first apiary's latitude to choose between `inspectPeriod{Spring,Summer,Autumn,Winter}` from their `Profile`.

## Third-party integrations

| Package | Purpose |
|---|---|
| **Apprise** | Outbound email transport in `background.py` (the only sender). |
| **Django REST Framework** + `authtoken` | The `/beedb/api/treatmentType/` endpoints. |
| **geopy** | Imported in `views.py` (`geopy.distance.distance`) — used for proximity/distance between apiaries. |
| **Pillow** | Image storage via `Picture.img = ImageField(...)`. |
| **psycopg2** | Postgres driver (no SQLite fallback — CI also runs against Postgres 16). |
| **django-mailer** | Installed in `INSTALLED_APPS` but not actively used (Apprise handles sending). |
| **Matomo** | `MATOMO_SITE_ID` injected into every template by [`beedb.context_processors.global_settings`](bee/beedb/context_processors.py). |
| **ruff** | Linter + formatter; CI auto-commits fixes via `lint.yml`. |
| **MkDocs (material)** | Docs site in [docs/](docs/), deployed to GitHub Pages by `deploy-mkdocs.yml`. |

## Testing

`TEST_RUNNER = "beedb.test.runner.FixtureOnceRunner"` — a `DiscoverRunner` subclass that **pre-loads `fixture3.json` once per test DB** rather than per-class. Tests under [bee/beedb/test/](bee/beedb/test/) assume fixture users (e.g. `rod@west.net.nz`) exist and use `serialized_rollback = True` with `setUpTestData`. CI ([.github/workflows/run-tests.yml](.github/workflows/run-tests.yml)) spins up a Postgres 16 service container and runs `migrate` + `test`.

## Notable architectural traits

- **Outbox pattern via `Message` table** — the web tier never touches SMTP; the only way to send is to insert a row.
- **Cross-process scheduling via DB** — no Celery, no cron. The `Config` table is the lock + last-run state.
- **Hemisphere-aware everywhere** — season logic guards against northern-hemisphere assumptions (default tz is `Pacific/Auckland`).
- **Function-based views only**, including the API — no CBV, no DRF ViewSets/Routers, no serializer-driven URL generation.
- **Single Django app** holds the whole domain — splits are by file (`views.py`, `adminViews.py`, `apiViews.py`, `profile.py`) rather than by app.
