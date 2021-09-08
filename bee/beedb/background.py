import django
import sys
import os
from django.conf import settings
import json
import datetime
import time
from django.utils import timezone
from django import template
from django.core.mail import send_mail

#from email.mime.text import MIMEText

import apprise

# timezone.make_aware(yourdate, timezone.get_current_timezone())

# need this to access django models and templates
sys.path.append("/code/bee")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "bee.settings")
django.setup()

from beedb.models import (
    Apiary,
    Profile,
    Colony,
    Inspection,
    Transfer,
    Audit,
    Diary,
    Config,
    Message,
    #webNotification,
)
from django.contrib.auth.models import User

# all config parameters are set as environment variables, best practice in docker environment
#eMqtt_client_id = os.getenv("AKLC_MQTT_CLIENT_ID", "mqtt_monitor")

eWeb_Base_URL = os.getenv("BEEDB_WEB_BASE_URL", "http://beedb.west.net.nz")

testFlag = os.getenv("BEEDB_TESTING", False)
testDailyFlag = os.getenv("BEEDB_TEST_DAILY", False)

# ********************************************************************
def testPr(tStr):
    if testFlag:
        print(tStr)
    return

# ******************************************************************
def check_config():
    """
    Checks config table and creates any config enties needed
    """
    # last daily update
    cfg, created = Config.objects.get_or_create(key="lstDaily")
    if created:
        cfg.configDt = timezone.now()
        cfg.configValue = 8                 # lets do 8:00 am
        cfg.lastUpdate = timezone.now()
    cfg.save()

    # last weekly update
    cfg, created = Config.objects.get_or_create(key="lstWeekly")
    if created:
        cfg.configDt = timezone.now()
        cfg.configValue = 8                 # lets do 8:00 am
        cfg.lastUpdate = timezone.now()
    cfg.save()


def sendMessage(msg):
    """
    Function that takes a message and sends it out by whatever channel the user defines
    """
    beek = Profile.objects.filter(user=msg.beek)[0]
    """
    smtp_host = "smtp.gmail.com"
    smtp_port = "465"
    smtp_user = "auto@west.net.nz"
    smtp_password = "jbmxqbvykpohrtmo"
    smtp_from = "auto@west.net.nz"
    smtp_from_name = "Bee database system"

    lUser = smtp_user.split("@")
    cUsr = lUser[0]
    cDomain = lUser[1]

    #print(f"Beek name is {beek.user.username}")
    apobj = apprise.Apprise()
    url = f"mailtos://{cUsr}:{smtp_password}@{cDomain}/{msg.beek.email}/?smtp={smtp_host}&from={smtp_from}&name={smtp_from_name}&user={smtp_user}"
    print(f"URL is {url}")
    apobj.add(url)
    if not apobj.notify(
            body = msg.body,
            title = msg.subject,
        ):
        print(f"Email not sent URL is {url}")
    else:
    
        msg.processed = True
        msg.processedDt = timezone.now()
        msg.save()
    """
    print("About to use send_mail")
    send_mail(subject = msg.subject, message = msg.body, from_email = settings.DEFAULT_FROM_EMAIL, recipient_list = [msg.beek.email], html_message = msg.html)
    print("send_mail finished")
    msg.processed = True
    msg.processedDt = timezone.now()
    msg.save()

    return

# ******************************************************************
def sys_background():
    """ The main program that cecks for back ground tasks
    """

    global scriptID

    print(" ")
    print(" ")
    print("---------------------------------")
    print("Start function - Background script")
    print("---------------------------------")

    # lets ensure the needed config parameters are available
    check_config()

    # initialise timers
    checkTimer = timezone.now()
    statusTimer = timezone.now()
    startTime = timezone.now()
    startedTime = timezone.now()

    print("About to start loop")

    while True:
        time.sleep(1)

        # this section runs regularly (every 15 sec) and does a number of functions
        if (timezone.now() - checkTimer) > datetime.timedelta(0, 15):  # second value is seconds to pause between....
            # update the checkpoint timer
            checkTimer = timezone.now()  # reset timer
            testPr("Time check")

        msgProc = Message.objects.filter(processed=False)
        if len(msgProc) > 0:
            for msg in msgProc:
                sendMessage(msg)
                




# ********************************************************************
if __name__ == "__main__":
    sys_background()
