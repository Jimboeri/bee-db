from django.conf import settings
import logging


def global_settings(request):
    isDev = (getattr(settings, "IS_DEV_ENV", False),)  # Defaults to False if not set

    logging.info(f"Dev setting is |{isDev}|")
    logging.info(f"Type is {type(isDev)}")
    if True in isDev:
        envMsg = "DEVELOPMENT"
        matomoId = 5  # defined on webstat.west.net.nz
    else:
        envMsg = ""
        matomoId = 1  # defined on webstat.west.net.nz
    return {
        "IS_DEV_ENV": isDev,
        "ENV_MSG": envMsg,
        "MATOMO_ID": matomoId,
    }
