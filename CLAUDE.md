# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Beekeeping records system: a Django 5.2 + PostgreSQL 16 web app for managing apiaries, colonies, inspections, diary reminders, and varroa treatments. Deployed via Docker Compose.

## Common commands

All commands run inside Docker Compose (the `web`/`background` containers mount the repo at `/code` and `WORKDIR` is `/code/bee/`).

```bash
# Start the stack (web on :8005, postgres on default port, background worker)
docker compose up

# Run the full Django test suite
docker compose run --rm web python manage.py test

# Run a single test class / method
docker compose run --rm web python manage.py test beedb.test.test_models.ModelTests
docker compose run --rm web python manage.py test beedb.test.test_models.ModelTests.test_Model_Colony

# Make / apply migrations
docker compose run --rm web python manage.py makemigrations
docker compose run --rm web python manage.py migrate

# Lint & format (CI runs these and auto-commits fixes via lint.yml)
ruff check --fix
ruff format

# Dump a fixture from current DB state
docker compose run --rm web python manage.py dumpdata > file.name

# Postgres shell (inside the db container)
psql -U postgres
```

The `background` container's `entrypoint.sh` auto-runs `migrate --noinput` on startup before launching `background.py`.

## Architecture

### Two-process layout

The system runs as **two cooperating Python processes** sharing the same Postgres DB:

1. **`web`** — standard Django app served by `runserver`/`gunicorn`, built from `Dockerfile`. Entry: `bee/manage.py`, project `bee.bee`, single app `beedb`.
2. **`background`** — a standalone long-running Python script (`bee/beedb/background.py`) built from `script-dockerfile` against `background-requirements.txt`. It calls `django.setup()` itself, then enters an infinite `while True` loop that:
   - Polls the `Message` table every second and dispatches unsent messages via [apprise](https://github.com/caronc/apprise) using a `mailtos://` URL.
   - Every 15s, checks whether the hour has rolled over (→ `procHourlyDiary`) or whether weekly summary emails are due (→ `procWeeklyReminders`).
   - On startup, calls `check_config()` to seed `Config` rows (`lstDaily`, `lstWeekly`, `commsWeeklyDay`) and `loadSizeChoices()` to upsert `SizeChoice` rows from `beedb/sizeChoice.json`.

The web app **never sends email directly**: views/signals create `Message` rows; the background process is the sole sender. The `Config` table is used as cross-process scheduling state (last-run timestamps + configured hour/day).

### Domain model (`bee/beedb/models.py`)

Ownership chain: `User` → `Apiary` → `Colony` → `Inspection`. A `Profile` is auto-created for every new `User` via a `post_save` signal at the bottom of `models.py` — don't add a second one. `Diary` entries are reminders attached to a colony with `dueDt`/`notifyDt`/`completed`; the background hourly job emails users when entries pass `dueDt` and `notifyDt is null`.

Key cross-cutting tables:
- `SizeChoice` — DB-driven choice text for Inspection.numbers/weight, keyed by `(size, type, value)`. Reloaded from `sizeChoice.json` on every background restart.
- `Config` — KV store for scheduling state used by `background.py`.
- `Audit` / `Transfer` — colony lifecycle events (split, combine, transfer, dead, etc.); see the docstring on `Audit` for transaction codes.
- `Picture` — uploads routed by `user_directory()` into per-user/apiary/colony/inspection paths under `MEDIA_ROOT`.

`Inspection.healthScore()` is the canonical hive-health computation (weighted average across eggs/varroa/weight/disease/temper); reuse it rather than recomputing.

### Hemisphere-aware seasons

`background.seasonCheck(latitude, dt)` returns spring/summer/autumn/winter based on date **and** the apiary's latitude (default project `TIME_ZONE = Pacific/Auckland`). `currentInspectionCycle(beek)` uses the user's *first* apiary's latitude to pick which `Profile.inspectPeriod{Spring,Summer,Autumn,Winter}` value drives "inspection overdue" warnings in weekly emails. Code that reasons about seasons must not hardcode northern-hemisphere months.

### URL & view layout

`bee.urls` mounts everything under `/beedb/` from `beedb/urls.py`. Views are split across:
- `views.py` — main CRUD for apiary/colony/inspection/diary/treatment, plus auth pages.
- `profile.py` — user profile + inspection/comms prefs.
- `adminViews.py` — `/beedb/adminIndex/` admin pages.
- `apiViews.py` + `serializers.py` — DRF endpoints under `/beedb/api/` (currently `treatmentType`).
- `forms.py` — all ModelForm definitions.
- `context_processors.global_settings` injects globals (e.g. `MATOMO_SITE_ID`) into every template.

### Testing

`TEST_RUNNER = "beedb.test.runner.FixtureOnceRunner"` — a custom `DiscoverRunner` subclass that **pre-loads `fixture3.json` once per test DB** (rather than per-class via `fixtures = [...]`). Tests assume the fixture's users (e.g. `rod@west.net.nz`) exist; new test classes can set `serialized_rollback = True` and reference fixture data via `setUpTestData`. See `bee/beedb/test/test_models.py` for the pattern.

The CI workflow `.github/workflows/run-tests.yml` spins up a Postgres 16 service and runs `manage.py migrate` + `manage.py test` — there is no SQLite path.

### Configuration

All runtime config comes from environment variables (see `docker-compose.yml` and `.env`). Notable ones beyond DB/SMTP:
- `BEEDB_WEB_BASE_URL` — used inside email templates rendered by `background.py` to build absolute links.
- `BEEDB_TESTING` / `BEEDB_TEST_DAILY` — when `Y`/`T`, the background process logs at DEBUG and may run "test now" branches in `sys_background()`.
- `ENVIRONMENT` — when set, prepended in brackets to outgoing email subjects (e.g. `[dev] Weekly summary...`).
- `LOGGER_LEVEL` — Django root logger level.
