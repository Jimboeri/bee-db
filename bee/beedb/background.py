
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

#import apprise

# need this to access django models and templates
sys.path.append("/code/bee")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "bee.settings")
django.setup()

from django.contrib.auth.models import User
import mailer
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
    # webNotification,
)

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

    # Day of week for weekly emails
    cfg, created = Config.objects.get_or_create(key="commsWeeklyDay")
    if created:
        cfg.configDt = timezone.now()
        cfg.configValue = 4                 # Mon = 0, Fri = 4, Sun = 6
        cfg.lastUpdate = timezone.now()
    cfg.save()

# ******************************************************************


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
    send_mail(subject=msg.subject, message=msg.body, from_email=settings.DEFAULT_FROM_EMAIL,
              recipient_list=[msg.beek.email], html_message=msg.html)
    print("send_mail finished")
    msg.processed = True
    msg.processedDt = timezone.now()
    msg.save()

    return

# ******************************************************************
def seasonCheck(latitude, inDt):
    """Returns season based on Date & latitude (north / south hemisphere)
    1 - Spring
    2 - Summer
    3 - Autumn
    4 - Winter
    """
    if inDt.month < 3 or (inDt.month == 3 and inDt.day < 22) :  # before March 21
        if latitude > 0:    # Northern hemisphere
            return(4)
        else:
            return(2)
    
    if inDt.month < 6 or (inDt.month == 6 and inDt.day < 22) :  # before June 21
        if latitude > 0:    # Northern hemisphere
            return(1)
        else:
            return(3)

    if inDt.month < 9 or (inDt.month == 9 and inDt.day < 22) :  # before Sept 21
        if latitude > 0:    # Northern hemisphere
            return(2)
        else:
            return(4)

    if inDt.month < 12 or (inDt.month == 12 and inDt.day < 22) :  # before Dec 21
        if latitude > 0:    # Northern hemisphere
            return(3)
        else:
            return(1)

    # Any thing left is after Dec 21
    if latitude > 0:    # Northern hemisphere
        return(4)
    else:
        return(2)


# ******************************************************************
def currentInspectionCycle(beek):
    """
    Checks for first apiary in N or S hemisphere, then reviews profile
    """
    apList = beek.apiary_set.all()
    if len(apList) > 0:
        season = seasonCheck(apList[0].latitude, timezone.now())
    else:
        season = 1              # Make spring the default
    if season == 1:             # Spring
        return(beek.profile.inspectPeriodSpring)
    elif season == 2:
        return(beek.profile.inspectPeriodSummer)
    elif season == 3:
        return(beek.profile.inspectPeriodAutumn)
    else:
        return(beek.profile.inspectPeriodWinter)


# ******************************************************************
def sendEmail(inDict, inTemplate, inBeek):
    t = template.loader.get_template(inTemplate)
    emailMessage = Message(beek=inBeek)
    emailMessage.html = t.render(inDict)
    emailMessage.subject = "Weekly summary from Bee-db"
    emailMessage.save()
    return

# ******************************************************************
def procWeeklyReminders():
    """Sends weekly summary emails"""
    beeks = User.objects.all()

    for beek in beeks:
        if beek.profile.commsWeeklySummary:
            print(f"Processing weekly summary for {beek.username}")
            apiaryDets = []
            apiaries = Apiary.objects.filter(beek=beek)
            for ap in apiaries:
                print(f"Processing apiary: {ap.apiaryID}")
                apDet = {"apID": ap.apiaryID,
                         "element": ap}
                colonies = Colony.objects.filter(apiary = ap)
                colonyDets = []
                for colony in colonies:
                    print(f"Processing colony: {colony.colonyID}")
                    if colony.status == "C":        # only send details on current colonies
                        colDet = {"element": colony}
                        # get last inspection
                        insp = colony.inspection_set.order_by("-dt")[:1]
                        if len(insp) > 0:
                            print(f"Colony: {colony.colonyID}, last inspection dt : {insp[0].dt}")
                            colDet["lstInspection"] = insp[0]
                            if (timezone.now() - insp[0].dt) / datetime.timedelta(days=1) > currentInspectionCycle(beek):
                                print("Inspection is late")
                                colDet["inspectionWarning"] = "Inspection for this colony is late"
                        else:
                            colDet["inspectionWarning"] = "This colony has no recorded inspections"
                        lstInspect = Inspection.objects.filter
                        colonyDets.append(colDet)

                apDet["colonies"] = colonyDets
                apiaryDets.append(apDet)
            print(apiaryDets)


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

    if testFlag:
        print("Testing - run weekly summary proc")
        procWeeklyReminders()

    while True:
        time.sleep(1)

        # this section runs regularly (every 15 sec) and does a number of functions
        # second value is seconds to pause between....
        if (timezone.now() - checkTimer) > datetime.timedelta(0, 15):
            # update the checkpoint timer
            checkTimer = timezone.now()  # reset timer
            testPr("Time check")

            # Check for weekly email summaries
            cfgWeeklyReminderWeekday = Config.objects.filter(
                key="commsWeeklyDay")
            cfgWeeklyReminderHour = Config.objects.filter(key="lstWeekly")
            if len(cfgWeeklyReminderWeekday) == 0 or len(cfgWeeklyReminderHour) == 0:
                continue
            #print(f"Weekly proc day check, now(): {timezone.now().weekday()}, config: {cfgWeeklyReminderWeekday[0].configValue}")
            if timezone.now().weekday() != cfgWeeklyReminderWeekday[0].configValue:
                continue

            #print("Passed weekday check")
            print(
                f"Time check, now: {timezone.now().hour}, config: {cfgWeeklyReminderHour[0].configValue}")
            if timezone.now().hour >= cfgWeeklyReminderHour[0].configValue:
                print("After the magic hour")
                if timezone.now().date() != cfgWeeklyReminderWeekday[0].configDt.date():
                    procWeeklyReminders()
                    cfgWeeklyReminderWeekday[0].configDt = timezone.now()
                    cfgWeeklyReminderWeekday[0].save()

        msgProc = Message.objects.filter(processed=False)
        if len(msgProc) > 0:
            for msg in msgProc:
                sendMessage(msg)


# ********************************************************************
if __name__ == "__main__":
    sys_background()
