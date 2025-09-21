# import re
import django  # type: ignore
import sys
import os
from django.conf import settings  # type: ignore
import json
import datetime
import time
from django.utils import timezone  # type: ignore
from django import template  # type: ignore
import logging

# from email.mime.text import MIMEText

import apprise  # type: ignore

# need this to access django models and templates
sys.path.append("/code/bee")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "bee.settings")
django.setup()

from django.contrib.auth.models import User  # type: ignore # noqa: E402

# import mailer
from beedb.models import (  # noqa: E402
    Apiary,
    # Profile,
    Colony,
    # Inspection,
    # Transfer,
    # Audit,
    Config,
    Message,
    SizeChoice,
    # webNotification,
)

# all config parameters are set as environment variables, best practice in docker environment
# eMqtt_client_id = os.getenv("AKLC_MQTT_CLIENT_ID", "mqtt_monitor")

eWeb_Base_URL = os.getenv("BEEDB_WEB_BASE_URL", "http://beedb.west.net.nz")

testFlagEnv = os.getenv("BEEDB_TESTING", "N")
testDailyFlag = os.getenv("BEEDB_TEST_DAILY", False)

if testFlagEnv.upper() == "TRUE" or testFlagEnv == "T" or testFlagEnv == "Y":
    testFlag = True
    logging.basicConfig(level=logging.DEBUG)
else:
    testFlag = False
    logging.basicConfig(level=logging.INFO)

# ********************************************************************


def testPr(tStr):
    if testFlag:
        logging.debug(tStr)
    return


# ******************************************************************
def check_config():
    """
    Checks config table and creates any config enties needed
    """
    # last daily update
    cfg, created = Config.objects.get_or_create(key="lstDaily")
    if created:
        logging.info("Config entry lstDaily created")
        cfg.configDt = timezone.now()
        cfg.configValue = 8  # lets do 8:00 am
        cfg.lastUpdate = timezone.now()
    cfg.save()

    # last weekly update
    cfg, created = Config.objects.get_or_create(key="lstWeekly")
    if created:
        logging.info("Config entry lstWeekly created")
        cfg.configDt = timezone.now()
        cfg.configValue = 8  # lets do 8:00 am
        cfg.lastUpdate = timezone.now()
    cfg.save()

    # Day of week for weekly emails
    cfg, created = Config.objects.get_or_create(key="commsWeeklyDay")
    if created:
        logging.info("Config entry commsWeeklyDay created")
        cfg.configDt = timezone.now()
        cfg.configValue = 4  # Mon = 0, Fri = 4, Sun = 6
        cfg.lastUpdate = timezone.now()
    cfg.save()


# ******************************************************************
def loadSizeChoices():
    """Loads model data from JSON file"""

    try:
        with open("beedb/sizeChoice.json") as f:
            data = json.load(f)
            for t in data:
                logging.debug(t["Type"])
                for rec in t["Records"]:
                    # logging.debug(rec['Value'])
                    sizeChoice, created = SizeChoice.objects.get_or_create(
                        size=rec["Size"],
                        type=t["Type"],
                        value=rec["Value"],
                    )
                    sizeChoice.text = rec["Text"]
                    sizeChoice.save()
                logging.debug("-----")
    except Exception as e:
        logging.error(f"Error loading sizeChoice.json - {e}")


# ******************************************************************
def sendMessage(msg):
    """
    Function that takes a message and sends it out by whatever channel the user defines
    """
    # beek = Profile.objects.filter(user=msg.beek)[0]

    smtp_host = os.environ.get("SMTP_HOST", "smtp.gmail.com")
    # smtp_port = os.environ.get("SMTP_PORT", 465)
    smtp_user = os.environ.get("SMTP_USER", "auto@west.net.nz")
    # smtp_password = os.environ.get("SMTP_PASSWORD")
    smtp_from = os.environ.get("SMTP_FROM", "auto@west.net.nz")
    smtp_from_name = "Bee database system"

    lUser = smtp_user.split("@")
    cUsr = lUser[0]
    cDomain = lUser[1]

    logging.debug(f"User - {cUsr}, password - {settings.EMAIL_HOST_PASSWORD}")

    # print(f"Beek name is {beek.user.username}")
    apobj = apprise.Apprise()
    # url = f"mailtos://{cUsr}:{smtp_password}@{cDomain}/{msg.beek.email}/?smtp={smtp_host}&from={smtp_from}&name={smtp_from_name}&user={smtp_user}"
    url = f"mailtos://{cUsr}:{settings.EMAIL_HOST_PASSWORD}@{cDomain}/{msg.beek.email}/?smtp={smtp_host}&from={smtp_from}&name={smtp_from_name}&user={smtp_user}"

    # print(f"URL is {url}")
    apobj.add(url)
    if not apobj.notify(
        body=msg.html,
        title=msg.subject,
    ):
        logging.warning(f"WARNING - Email not sent URL is {url}")
    else:
        msg.processed = True
        msg.processedDt = timezone.now()
        msg.save()

    # logging.info("About to use send_mail")
    # send_mail(subject=msg.subject, message=msg.body, from_email=settings.DEFAULT_FROM_EMAIL,
    #          recipient_list=[msg.beek.email], html_message=msg.html)
    # logging.info("send_mail finished")
    # msg.processed = True
    # msg.processedDt = timezone.now()
    # msg.save()

    return


# ******************************************************************
def seasonCheck(latitude, inDt):
    """Returns season based on Date & latitude (north / south hemisphere)
    1 - Spring
    2 - Summer
    3 - Autumn
    4 - Winter
    """
    if inDt.month < 3 or (inDt.month == 3 and inDt.day < 22):  # before March 21
        if latitude > 0:  # Northern hemisphere
            return 4
        else:
            return 2

    if inDt.month < 6 or (inDt.month == 6 and inDt.day < 22):  # before June 21
        if latitude > 0:  # Northern hemisphere
            return 1
        else:
            return 3

    if inDt.month < 9 or (inDt.month == 9 and inDt.day < 22):  # before Sept 21
        if latitude > 0:  # Northern hemisphere
            return 2
        else:
            return 4

    if inDt.month < 12 or (inDt.month == 12 and inDt.day < 22):  # before Dec 21
        if latitude > 0:  # Northern hemisphere
            return 3
        else:
            return 1

    # Any thing left is after Dec 21
    if latitude > 0:  # Northern hemisphere
        return 4
    else:
        return 2


# ******************************************************************
def currentInspectionCycle(beek):
    """
    Checks for first apiary in N or S hemisphere, then reviews profile
    """
    apList = beek.apiary_set.all()
    if len(apList) > 0:
        season = seasonCheck(apList[0].latitude, timezone.now())
    else:
        season = 1  # Make spring the default
    if season == 1:  # Spring
        return beek.profile.inspectPeriodSpring
    elif season == 2:
        return beek.profile.inspectPeriodSummer
    elif season == 3:
        return beek.profile.inspectPeriodAutumn
    else:
        return beek.profile.inspectPeriodWinter


# ******************************************************************
def sendEmail(inDict, inTemplate, inBeek):
    t = template.loader.get_template(inTemplate)  # type: ignore
    emailMessage = Message(beek=inBeek)
    emailMessage.html = t.render(inDict)
    emailMessage.subject = "Weekly summary from Bee-db"
    emailMessage.save()
    return


# ******************************************************************
def procDailyDiary():
    """
    This module looks to see if any diary entries have recently become due
    """

    # get all the users
    beeks = User.objects.all()

    for beek in beeks:
        logging.info(f"Processing beek: {beek.username}")

        beekNewReminders = []
        beekOldReminders = []

        apiaries = Apiary.objects.filter(beek=beek)
        for ap in apiaries:
            logging.info(f"Processing apiary: {ap.apiaryID}")
            colonies = Colony.objects.filter(apiary=ap)
            for colony in colonies:
                logging.info(f"Processing colony: {colony.colonyID}")
                newReminders = (
                    colony.diary_set.order_by("dueDt") # type: ignore
                    .filter(completed=False)
                    .filter(dueDt__lte=timezone.now())
                    .filter(notifyDt__isnull=True)
                )
                if len(newReminders) > 0:
                    logging.info(f"Reminder due for {colony.colonyID}")
                    for nR in newReminders:
                        beekNewReminders.append(nR)
                    # send reminder

                    oldReminders = (
                        colony.diary_set.order_by("dueDt") # type: ignore
                        .filter(completed=False)
                        .filter(dueDt__lte=timezone.now())
                        .filter(notifyDt__isnull=False)
                    )
                    if len(oldReminders) > 0:
                        logging.info(f"Reminder overdue for {colony.colonyID}")
                        beekOldReminders.append(oldReminders)

        if beekNewReminders:
            context = {
                "beek": beek,
                "newReminders": beekNewReminders,
                "oldReminders": beekOldReminders,
                "web_base_url": eWeb_Base_URL,
            }

            sendEmail(context, "beedb/email/reminderSummary.html", beek)

            #for reminder in beekNewReminders:
            #    reminder.notifyDt = timezone.now()
            #    reminder.save()

    return


# ******************************************************************
def procWeeklyReminders():
    """Sends weekly summary emails"""
    beeks = User.objects.all()

    for beek in beeks:
        if beek.profile.commsWeeklySummary:  # type: ignore
            logging.info(f"Processing weekly summary for {beek.username}")
            apiaryDets = []
            apiaries = Apiary.objects.filter(beek=beek)
            for ap in apiaries:
                logging.info(f"Processing apiary: {ap.apiaryID}")
                apDet = {"apID": ap.apiaryID, "element": ap}
                colonies = Colony.objects.filter(apiary=ap)
                liveApiary = False
                colonyDets = []
                for colony in colonies:
                    logging.info(f"Processing colony: {colony.colonyID}")
                    if colony.status == "C":  # only send details on current colonies
                        liveApiary = True
                        colDet = {"element": colony}
                        # get last inspection
                        # i1 = colony.lastInspection()
                        insp = colony.inspection_set.order_by("-dt")[:1]  # type: ignore
                        if len(insp) > 0:
                            logging.info(
                                f"Colony: {colony.colonyID}, last inspection dt : {insp[0].dt}"
                            )
                            colDet["lstInspection"] = insp[0]
                            if (timezone.now() - insp[0].dt) / datetime.timedelta(
                                days=1
                            ) > currentInspectionCycle(beek):
                                logging.info("Inspection is late")
                                colDet["lateInspectionWarning"] = "True"  # type: ignore
                        else:
                            colDet["inspectionWarning"] = (  # type: ignore
                                "This colony has no recorded inspections"  # type: ignore
                            )

                        reminders = colony.diary_set.order_by("dueDt").filter(  # type: ignore
                            completed=False
                        )
                        logging.info(f"{len(reminders)} reminders found")
                        colDet["reminders"] = reminders

                        colonyDets.append(colDet)

                apDet["colonies"] = colonyDets
                if liveApiary:  # Onle send info if there are live colonies
                    apiaryDets.append(apDet)
            logging.info(apiaryDets)
            if len(apiaryDets) > 0:
                context = {
                    "apList": apiaryDets,
                    "beek": beek,
                    "web_base_url": eWeb_Base_URL,
                }
                sendEmail(context, "beedb/email/weekly_summary.html", beek)

    # update the last run date
    logging.info("Finished processing weekly emails")
    cfgWeeklyReminderWeekday, created = Config.objects.get_or_create(
        key="commsWeeklyDay"
    )
    cfgWeeklyReminderWeekday.configDt = timezone.now()
    cfgWeeklyReminderWeekday.save()
    logging.info(f"Config updated - now is {cfgWeeklyReminderWeekday.configDt}")

    return


# ******************************************************************
def checkIfWeeklyReminders():
    """
    Checks to see if we should send weekly reminders
    """
    # get the config values
    cfgWeeklyReminderWeekday, created = Config.objects.get_or_create(
        key="commsWeeklyDay"
    )
    cfgWeeklyReminderHour, created = Config.objects.get_or_create(key="lstWeekly")

    # logging.debug(
    #    f"Checking weekly reminders, weekday = {cfgWeeklyReminderWeekday.configValue}, hour = {cfgWeeklyReminderHour.configValue}"
    # )
    # logging.debug(
    #    f"Current time is {timezone.now()}, last run was {cfgWeeklyReminderWeekday.configDt}"
    # )

    # only run on the correct day of the week
    # logging.debug(f"Day of week = {timezone.now().weekday()}, config = {cfgWeeklyReminderWeekday.configValue}")
    if timezone.now().weekday() != cfgWeeklyReminderWeekday.configValue:
        return False

    # ignore if already run today
    # logging.debug(f"Date check, today: {timezone.now().date()}, config: {cfgWeeklyReminderWeekday.configDt.date()}") # type: ignore
    if timezone.now().date() == cfgWeeklyReminderWeekday.configDt.date():  # type: ignore
        # logging.debug("Already run today")
        return False

    # only run after the magic hour
    # logging.debug(
    #    f"Hour check, now: {timezone.now().hour}, config: {cfgWeeklyReminderHour.configValue}"
    # )
    if timezone.now().hour >= cfgWeeklyReminderHour.configValue:  # type: ignore
        logging.debug("After the magic hour")
        return True

    return False


# ******************************************************************
def sys_background():
    """The main program that cecks for back ground tasks"""

    global scriptID

    logging.info(" ")
    logging.info(" ")
    logging.info("---------------------------------")
    logging.info("Start function - Background script")
    logging.info("---------------------------------")

    # lets ensure the needed config parameters are available
    check_config()

    # Do initial table load
    loadSizeChoices()

    # initialise timers
    checkTimer = timezone.now()
    # statusTimer = timezone.now()
    # startTime = timezone.now()

    logging.info(f"About to start loop, time is {timezone.now()}")

    if testFlag:
        logging.info("Testing - run weekly summary proc")
        logging.info("---------------------------------")
        #procWeeklyReminders()
        logging.info("---------------------------------")
        logging.info("Testing - run daily diary proc")
        logging.info("---------------------------------")
        procDailyDiary()
        logging.info("---------------------------------")

    while True:
        time.sleep(1)

        # this section runs regularly (every 15 sec) and does a number of functions
        # second value is seconds to pause between....
        if (timezone.now() - checkTimer) > datetime.timedelta(0, 15):
            # update the checkpoint timer
            checkTimer = timezone.now()  # reset timer
            testPr("Time check")

            # Check for weekly email summaries
            if checkIfWeeklyReminders():
                procWeeklyReminders()

        msgProc = Message.objects.filter(processed=False)
        if len(msgProc) > 0:
            for msg in msgProc:
                sendMessage(msg)


# ********************************************************************
if __name__ == "__main__":
    sys_background()
