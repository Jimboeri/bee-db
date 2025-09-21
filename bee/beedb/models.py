import datetime
import logging

from django.contrib.auth.models import User  # type: ignore
from django.db import models  # type: ignore
from django.db.models.signals import post_save  # type: ignore
from django.dispatch import receiver  # type: ignore
from django.utils import timezone  # type: ignore

# define some re-used choice options
VARROA_CHOICES = [
    (0, "Not recorded"),
    (1, "No varroa seen"),
    (2, "1 - 2 varroa / 300 bees"),
    (3, "3 - 6 varroa / 300 bees"),
    (4, "7 - 15 varroa / 300 bees"),
    (5, "More than 15 varroa / 300 bees"),
]

EGG_CHOICES = [
    (0, "Not recorded"),
    (1, "Lots of eggs & larvae, good brood pattern"),
    (2, "Lots of eggs & larvae, but spotty brood"),
    (3, "Small - reasonable eggs & larvae"),
    (4, "A few larvae, no eggs seen"),
    (5, "None"),
]

DISEASE_CHOICES = [
    (0, "Not recorded"),
    (1, "No disease present"),
    (3, "Some disease"),
    (5, "Heavy disease infection"),
]

TEMPER_CHOICES = [
    (0, "Not recorded"),
    (1, "Calm bees"),
    (3, "Bees a bit defensive"),
    (5, "Bees attack beekeeper"),
]

STATUS_CHOICES = [
    ("C", "Current"),
    ("D", "Dead"),
    ("A", "Absconded"),
    ("S", "Sold/given"),
    ("M", "Combined"),
]
# Create your models here.


class Apiary(models.Model):
    """ """

    # beekold1 = models.ForeignKey(Beek, on_delete=models.SET_NULL, null=True, blank=True)
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiaryID = models.CharField(max_length=50)
    descr = models.TextField(blank=True, null=True)
    latitude = models.DecimalField(max_digits=12, decimal_places=7, default=0)  # type: ignore
    longitude = models.DecimalField(max_digits=12, decimal_places=7, default=0)  # type: ignore
    ownerResident = models.CharField(
        "Name of owner / occupier", max_length=200, blank=True, null=True
    )
    residentPhone = models.CharField(max_length=50, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    location = models.TextField(
        blank=True, null=True, help_text="Where the hives are located"
    )
    hazards = models.TextField(blank=True, null=True)

    class Meta:
        ordering = ["apiaryID"]

    def __str__(self):
        return self.apiaryID


class Profile(models.Model):
    """
    This model is used to extend the user model.

    """

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phoneNumber = models.CharField(max_length=50, blank=True, null=True)
    bkRegistration = models.CharField(max_length=10, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    lastApiary = models.ForeignKey(
        Apiary,
        blank=True,
        null=True,
        help_text="The last apiary selected from the index page",
        on_delete=models.SET_NULL,
    )
    inspectPeriodSummer = models.IntegerField(
        "Days between inspections in summer", default=14
    )
    inspectPeriodAutumn = models.IntegerField(
        "Days between inspections in autumn/fall", default=14
    )
    inspectPeriodWinter = models.IntegerField(
        "Days between inspections in winter", default=60
    )
    inspectPeriodSpring = models.IntegerField(
        "Days between inspections in spring", default=7
    )
    inspectHealthIndex = models.BooleanField(default=True)
    inspectManualIndex = models.BooleanField(default=False)
    inspectDiaryAdd = models.BooleanField(default=True)

    commsWeeklySummary = models.BooleanField(
        "Do you want weekly summary emails?", default=False
    )
    commsInspectionReminder = models.BooleanField(default=False)
    commsLstWeeklyEmail = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.user.username


@receiver(post_save, sender=User)
def createProfile(sender, **kwargs):
    if kwargs.get("created", False):
        Profile.objects.get_or_create(user=kwargs.get("instance"))


class Colony(models.Model):
    SIZE_CHOICES = [
        (1, "Micro - 3 - mini frames"),
        (2, "Little - queen castle or nuc"),
        (3, "Small - single storey brood chamber, 9-10 frames"),
        (4, "Large - double storey brood chamber, 18 - 20 frames"),
        (5, "Huge - 3 or more storey brood chamber"),
    ]

    apiary = models.ForeignKey(Apiary, on_delete=models.CASCADE)
    colonyID = models.CharField(max_length=50)
    descr = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    status = models.CharField(
        max_length=1,
        help_text="Current status of hive)",
        choices=STATUS_CHOICES,
        default="C",
    )
    status_dt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    lastAction = models.DateTimeField(null=True, blank=True, default=timezone.now)
    queenRight = models.BooleanField(default=True)
    size = models.IntegerField(
        default=3,
        help_text="Size of the colony",
        choices=SIZE_CHOICES,
    )

    class Meta:
        ordering = ["colonyID"]

    def __str__(self):
        return self.colonyID

    def lastInspection(self):
        lstInsp = self.inspection_set.order_by("-dt")[:1]  # type: ignore
        if len(lstInsp) > 0:
            return lstInsp[0]
        else:
            logging.debug("No inspections available")
            return

    def statusDisplay(self):
        for e in STATUS_CHOICES:
            if e[0] == self.status:
                return e[1]
        return "?"


class Inspection(models.Model):
    """
    Model for colony inspections
    """

    # These choices are overwritten from a DB table, but are necessary for validation
    WEIGHT_CHOICES = [
        (0, "Not recorded"),
        (1, "Not recorded"),
        (2, "Not recorded"),
        (3, "Not recorded"),
        (4, "Not recorded"),
        (5, "No stores"),
    ]

    QUEEN_CHOICES = [
        (0, "Not recorded"),
        (1, "This season queen"),
        (2, "Last season queen"),
        (3, "2 years or older queen"),
    ]

    colony = models.ForeignKey(Colony, on_delete=models.CASCADE)
    dt = models.DateTimeField(
        null=True,
        blank=True,
        default=timezone.now,
    )
    notes = models.TextField(blank=True, null=True)
    numbers = models.IntegerField(
        default=0,
    )
    eggs = models.IntegerField(
        help_text="How much eggs and larvae is in the hive?",
        choices=EGG_CHOICES,
        default=0,
    )
    varroa = models.IntegerField(
        help_text="How much varroa is in the hive?",
        choices=VARROA_CHOICES,
        default=0,
    )
    weight = models.IntegerField(
        default=0,
    )
    disease = models.IntegerField(
        help_text="How healthy is the hive?",
        choices=DISEASE_CHOICES,
        default=0,
    )
    temper = models.IntegerField(
        help_text="How happy is the hive?",
        choices=TEMPER_CHOICES,
        default=0,
    )
    queen_seen = models.BooleanField(default=False)
    # addDiary = models.BooleanField(default=False, help_text="Add a reminder?")
    # addTreatment = models.BooleanField(
    #    default=False, help_text="Add a reminder?")
    size = models.IntegerField(blank=True, null=True)

    class Meta:
        ordering = ["-dt"]

    def numChoiceDisplay(self):
        Numbs = (
            SizeChoice.objects.filter(size=self.size)
            .filter(type__iexact="Number")
            .filter(value=self.numbers)
        )
        if Numbs:
            return Numbs[0].text
        return " "

    def weightChoiceDisplay(self):
        Numbs = (
            SizeChoice.objects.filter(size=self.size)
            .filter(type__iexact="Weight")
            .filter(value=self.weight)
        )
        if Numbs:
            return Numbs[0].text
        return " "

    def varroaChoiceDisplay(self):
        for v in VARROA_CHOICES:
            if v[0] == self.varroa:
                return v[1]
        return "?"

    def eggChoiceDisplay(self):
        for e in EGG_CHOICES:
            if e[0] == self.eggs:
                return e[1]
        return "?"

    def diseaseChoiceDisplay(self):
        for e in DISEASE_CHOICES:
            if e[0] == self.disease:
                return e[1]
        return "?"

    def temperChoiceDisplay(self):
        for e in TEMPER_CHOICES:
            if e[0] == self.temper:
                return e[1]
        return "?"

    def healthScore(self):
        nPoss = 0
        nScore = 0
        if self.numbers > 0:
            nPoss = nPoss + 5
            nScore = nScore + 6 - self.numbers

        if self.eggs > 0:
            nPoss = nPoss + 5
            nScore = nScore + 6 - self.eggs

        if self.varroa > 0:
            nPoss = nPoss + 10
            nScore = nScore + 11 - self.varroa * 2
        else:
            nPoss = nPoss + 1

        if self.weight > 0:
            nPoss = nPoss + 5
            nScore = nScore + 6 - self.weight

        if self.disease > 0:
            nPoss = nPoss + 3
            nScore = nScore + 4 - self.disease

        if self.temper > 0:
            nPoss = nPoss + 3
            nScore = nScore + 4 - self.temper

        # logging.debug(
        #    f"Health score, Poss: {nPoss}, Score {nScore}, result {(nScore / nPoss) * 100}%")
        return (nScore / nPoss) * 100

    def __str__(self):
        return f"Date: {self.dt}, Colony: {self.colony.colonyID}, health: {self.healthScore():.1f}"


class Transfer(models.Model):
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    # queen = .....
    dt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    outgoing = models.BooleanField(
        default=True, help_text="True if colony going to another beekeeper"
    )
    transaction = models.IntegerField(
        default=0,
        help_text="1 - Sold/given, 2 - Bought/received, 3 - Swarm, 4 - New entry, 5 - Split",
    )
    beek_name = models.CharField(max_length=50, blank=True, null=True)
    beek_registration = models.CharField(max_length=50, blank=True, null=True)
    beek_email = models.EmailField(max_length=50, blank=True, null=True)
    beek_phone = models.CharField(max_length=50, blank=True, null=True)
    beek_address = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    cost = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    location = models.CharField(max_length=200, blank=True, null=True)
    size = models.IntegerField(
        default=0,
        help_text="1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)",
    )

    class Meta:
        ordering = ["-dt"]

    def __str__(self):
        return f"Colony: {self.colony.colonyID}"  # type: ignore


class Audit(models.Model):
    """
    Table to store transactions
    Transaction codes:
    1 - Sell / gift to another beek
    2 - Split colony
    3 - Collect swarm
    4 - Purchase / acquire colony
    5 - Initial colony creation
    6 - Combine colonies
    7 - Move colony to new apiary
    8 - Colony dead
    """

    dt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiary = models.ForeignKey(Apiary, on_delete=models.SET_NULL, null=True, blank=True)
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    colony1 = models.ForeignKey(
        Colony, on_delete=models.SET_NULL, null=True, blank=True, related_name="+"
    )
    transaction_cd = models.IntegerField(
        default=0,
    )
    detail = models.TextField(blank=True, null=True)
    transfer = models.ForeignKey(
        Transfer, on_delete=models.SET_NULL, null=True, blank=True
    )

    def __str__(self):
        return f"Date: {self.dt}, beek: {self.beek.username}, Col: {self.colony.colonyID}, Tr code: {self.transaction_cd} "  # type: ignore


class Diary(models.Model):
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiary = models.ForeignKey(Apiary, on_delete=models.SET_NULL, null=True, blank=True)
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    createdDt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    startDt = models.DateTimeField(null=True, blank=True)
    dueDt = models.DateTimeField(
        "Date to complete by", default=timezone.now() + datetime.timedelta(weeks=1)
    )
    notifyDt = models.DateTimeField(null=True, blank=True)
    subject = models.CharField(max_length=100, null=True, blank=True)
    details = models.TextField(blank=True, null=True)
    completed = models.BooleanField(default=False)

    def __str__(self):
        return f"Beek: {self.beek.username}, Subject: {self.subject}"

    class Meta:
        ordering = ["-dueDt"]


class Config(models.Model):
    key = models.CharField(max_length=500)
    configDt = models.DateTimeField(null=True, blank=True)
    configValue = models.FloatField(null=True, blank=True)
    lastUpdate = models.DateTimeField(null=True, blank=True, default=timezone.now)

    def __str__(self):
        return f"{self.key}"


class Message(models.Model):
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.CharField(max_length=100)
    body = models.TextField(blank=True, null=True)
    html = models.TextField(blank=True, null=True)
    processed = models.BooleanField(default=False)
    createdDt = models.DateTimeField(
        default=timezone.now,
    )
    processedDt = models.DateTimeField(null=True, blank=True)


class Feedback(models.Model):
    """
    Table to store feedback, bug reports etc
    """

    FEEDBACK_CHOICES = [
        ("F", "General feedback"),
        ("B", "Bug report (error)"),
        ("R", "Request a feature"),
        ("S", "Suggestion"),
    ]
    STATUS_CHOICES = [
        ("N", "New feedback"),
        ("I", "Issue raised"),
        ("A", "Archived"),
    ]
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.CharField(max_length=100, help_text="A short description")
    detail = models.TextField(
        blank=True, null=True, help_text="The detail of your feedback"
    )
    feedbackType = models.CharField(
        max_length=1,
        help_text="What sort of feedback is this?",
        choices=FEEDBACK_CHOICES,
        default="F",
    )
    status = models.CharField(
        max_length=1,
        blank=True,
        null=True,
        default="N",
        choices=STATUS_CHOICES,
    )
    # status codes:
    #       N - New
    #       A - Archived (won't be seen)
    devComment = models.TextField(blank=True, null=True)
    createdDt = models.DateTimeField(
        default=timezone.now,
    )
    lstStatusDt = models.DateTimeField(null=True, blank=True)
    lstCommentDt = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"{self.subject} (from {self.beek.username})"


class TreatmentType(models.Model):
    """
    Table to store types of treatments
    """

    name = models.CharField(max_length=100)
    manufacturer = models.CharField(max_length=100)
    organic = models.BooleanField(default=False)
    requireRemoval = models.BooleanField(default=False)
    daysInHive = models.IntegerField(blank=True, null=True)
    url = models.URLField(blank=True, null=True)
    description = models.TextField()
    instructions = models.TextField()

    def __str__(self):
        return f"{self.name}"


class Treatment(models.Model):
    treatmentType = models.ForeignKey(TreatmentType, on_delete=models.CASCADE)
    colony = models.ForeignKey(Colony, on_delete=models.CASCADE)
    completed = models.BooleanField("Treatment completed & removed", default=False)
    insertDt = models.DateTimeField(
        "Date treatment put in", default=timezone.now, blank=True, null=True
    )
    removeDt = models.DateTimeField(
        "Date treatment to be removed", blank=True, null=True
    )
    trNotes = models.TextField(blank=True, null=True)
    inspection = models.ForeignKey(
        Inspection, on_delete=models.SET_NULL, null=True, blank=True
    )
    preVarroa = models.IntegerField(
        "Varroa count before treatment",
        help_text="How much varroa is in the hive before treating?",
        choices=VARROA_CHOICES,
        default=0,
    )
    postVarroa = models.IntegerField(
        "Varroa count after treatment",
        help_text="How much varroa is in the hive after treating?",
        choices=VARROA_CHOICES,
        default=0,
    )

    def preVarroaChoiceDisplay(self):
        for v in VARROA_CHOICES:
            if v[0] == self.preVarroa:
                return v[1]
        return "?"

    def postVarroaChoiceDisplay(self):
        for v in VARROA_CHOICES:
            if v[0] == self.postVarroa:
                return v[1]
        return "?"

    def __str__(self):
        return f"{self.treatmentType.name} in {self.colony.colonyID}"


class SizeChoice(models.Model):
    size = models.IntegerField()
    type = models.CharField(max_length=10)
    value = models.IntegerField()
    text = models.CharField(max_length=40)

    class Meta:
        ordering = ["type", "size", "value"]

    def __str__(self):
        return f"Size: {self.size}, type: {self.type}, value: {self.value}, text: {self.text}"


def user_directory(instance, filename):
    if instance.inspection:
        return f"images/{instance.inspection.colony.apiary.beek.id}/{instance.inspection.colony.apiary.id}/{instance.inspection.colony.id}/{instance.inspection.id}/{filename}"

    if instance.colony:
        return f"images/{instance.colony.apiary.beek.id}/{instance.colony.apiary.id}/{instance.colony.id}/{filename}"

    if instance.apiary:
        return f"images/{instance.apiary.beek.id}/{instance.apiary.id}/{filename}"

    if instance.beek:
        return f"images/{instance.beek.id}/{filename}"

    return f"images/{filename}"


class Picture(models.Model):
    title = models.CharField(max_length=100)
    img = models.ImageField(upload_to=user_directory)
    beek = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    apiary = models.ForeignKey(Apiary, on_delete=models.SET_NULL, null=True, blank=True)
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    inspection = models.ForeignKey(
        Inspection, on_delete=models.SET_NULL, null=True, blank=True
    )
    uploadDt = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ["-uploadDt"]

    def __str__(self):
        return f"Title: {self.title}, uploaded {self.uploadDt}"
