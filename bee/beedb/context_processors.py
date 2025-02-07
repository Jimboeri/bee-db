import os


def global_settings(request):
    # isDev = (getattr(settings, "IS_DEV_ENV", False),)  # Defaults to False if not set

    matomoId = os.environ.get("MATOMO_SITE_ID", "")

    if matomoId == "5":
        envMsg = "DEVELOPMENT"
    else:
        envMsg = ""
    return {
        "ENV_MSG": envMsg,
        "MATOMO_ID": matomoId,
    }
