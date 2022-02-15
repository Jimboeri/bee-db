from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
import datetime
from django.dispatch import receiver
from django.db.models.signals import post_save


# Create your models here.


#class Beek(models.Model):
#    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
#    bkRegistration = models.CharField(max_length=10, blank=True, null=True)
#    address = models.TextField(blank=True, null=True)
#    name = models.CharField(max_length=100)
#    email = models.EmailField(blank=True, null=True)

#    def __str__(self):
#        return self.name


class Apiary(models.Model):
    """
    """

    #beekold1 = models.ForeignKey(Beek, on_delete=models.SET_NULL, null=True, blank=True)
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiaryID = models.CharField(max_length=50)
    descr = models.TextField(blank=True, null=True)
    latitude  = models.DecimalField(max_digits=10, decimal_places=5, default=0)
    longitude  = models.DecimalField(max_digits=10, decimal_places=5, default=0)
    ownerResident = models.CharField("Name of owner / occupier", max_length=200, blank=True, null=True)
    residentPhone = models.CharField(max_length=50, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    location = models.TextField(blank=True, null=True, help_text="Where the hives are located")
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
    inspectPeriodSummer = models.IntegerField("Days between inspections in summer", default=14)
    inspectPeriodAutumn = models.IntegerField(default=14)
    inspectPeriodWinter = models.IntegerField(default=60)
    inspectPeriodSpring = models.IntegerField(default=7)
    inspectHealthIndex = models.BooleanField(default=True)
    inspectManualIndex = models.BooleanField(default=False)
    inspectDiaryAdd = models.BooleanField(default=True)

    commsWeeklySummary = models.BooleanField("Do you want weekly summary emails?", default=False)
    commsInspectionReminder = models.BooleanField(default=False)
    commsLstWeeklyEmail = models.DateTimeField(null=True, blank=True)


    def __str__(self):
        return self.user.username

@receiver(post_save, sender=User)
def createProfile(sender, **kwargs):
    if kwargs.get('created', False):
        Profile.objects.get_or_create(user=kwargs.get('instance'))


class Colony(models.Model):
    STATUS_CHOICES = [
        ("C", "Current"),
        ("D", "Dead"),
        ("A", "Absconded"),
        ("S", "Sold/given"),
        ("M", "Combined"),
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
    status_dt = models.DateTimeField(null=True, blank=True, default = timezone.now)
    lastAction = models.DateTimeField(null=True, blank=True, default = timezone.now)
    queenRight = models.BooleanField(default=True)
    size = models.IntegerField(default=3)

    class Meta:
        ordering = ["colonyID"]

    def __str__(self):
        return self.colonyID


class Inspection(models.Model):
    """
    Model for colony inspections
    """

    NUMBER_CHOICES = [
        (0, "Not recorded"),
        (1, "Bees on 20 or more frames"),
        (2, "Bees on 10 - 20 frames"),
        (3, "bees on 4 - 9 frames"),
        (4, "Bees on 3 or less frames"),
        (5, "Less than a frame of bees"),
    ]
    EGG_CHOICES = [
        (0, "Not recorded"),
        (1, "Lots of eggs & larvae, good brood pattern"),
        (2, "Lots of eggs & larvae, but spotty brood"),
        (3, "Small - reasonable eggs & larvae"),
        (4, "A few larvae, no eggs seen"),
        (5, "None"),
    ]
    VARROA_CHOICES = [
        (0, "Not recorded"),
        (1, "No varroa seen"),
        (2, "1 - 2 varroa"),
        (3, "3 - 6 varroa"),
        (4, "7 - 15 varroa"),
        (5, "More than 15 varroa"),
    ]
    WEIGHT_CHOICES = [
        (0, "Not recorded"),
        (1, "Greater than 20 kg"),
        (2, "15 - 20 kg, plenty of stores"),
        (3, "10 - 15 kg"),
        (4, "Less than 10 kg, hardly any stores"),
        (5, "No weight, no stores"),
    ]
    DISEASE_CHOICES = [
        (0, "Not recorded"),
        (1, "No disease present"),
        (3, "Some disease"),
        (5, "Heavy disease infection"),
    ]
    QUEEN_CHOICES = [
        (0, "Not recorded"),
        (1, "This season queen"),
        (2, "Last season queen"),
        (3, "2 years or older queen"),
    ]
    TEMPER_CHOICES = [
        (0, "Not recorded"),
        (1, "Calm bees"),
        (3, "Bees a bit defensive"),
        (5, "Bees attach beekeeper"),
    ]
    colony = models.ForeignKey(Colony, on_delete=models.CASCADE)
    dt = models.DateTimeField(null=True, blank=True, default=timezone.now,)
    notes = models.TextField(blank=True, null=True)
    numbers = models.IntegerField(
        help_text="How many bees in the hive (seams of bees)",
        choices=NUMBER_CHOICES,
        default=0,
    )
    eggs = models.IntegerField(
        help_text="How much eggs and larvae is in the hive",
        choices=EGG_CHOICES,
        default=0,
    )
    varroa = models.IntegerField(
        help_text="How much varroa is in the hive", choices=VARROA_CHOICES, default=0,
    )
    weight = models.IntegerField(
        help_text="How heavy is the hive", choices=WEIGHT_CHOICES, default=0,
    )
    disease = models.IntegerField(
        help_text="How healthy is the hive", choices=DISEASE_CHOICES, default=0,
    )
    temper = models.IntegerField(
        help_text="How happy is the hive", choices=TEMPER_CHOICES, default=0,
    )
    queen_seen = models.BooleanField(default=False)

    class Meta:
        ordering = ["-dt"]

class Transfer(models.Model):
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    #queen = .....
    dt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    outgoing = models.BooleanField(default=True, help_text="True if colony going to another beekeeper")
    transaction = models.IntegerField(default = 0, help_text = "1 - Sold/given, 2 - Bought/received, 3 - Swarm, 4 - New entry, 5 - Split")
    beek_name = models.CharField(max_length=50, blank=True, null=True)
    beek_registration = models.CharField(max_length=50, blank=True, null=True)
    beek_email = models.EmailField(max_length=50, blank=True, null=True)
    beek_phone = models.CharField(max_length=50, blank=True, null=True)
    beek_address = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    cost = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    location = models.CharField(max_length=200, blank=True, null=True)
    size = models.IntegerField(default = 0, help_text = "1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)")

    class Meta:
        ordering = ["-dt"]

    def __str__(self):
        return(f"Colony: {self.colony.colonyID}")
        

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
    """
    dt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiary = models.ForeignKey(Apiary, on_delete=models.SET_NULL, null=True, blank=True)
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    colony1 = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True, related_name='+')
    transaction_cd = models.IntegerField(default = 0,)
    detail = models.TextField(blank=True, null=True)

class Diary(models.Model):
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    apiary = models.ForeignKey(Apiary, on_delete=models.SET_NULL, null=True, blank=True)
    colony = models.ForeignKey(Colony, on_delete=models.SET_NULL, null=True, blank=True)
    createdDt = models.DateTimeField(null=True, blank=True, default=timezone.now)
    startDt = models.DateTimeField(null=True, blank=True)
    dueDt = models.DateTimeField()
    notifyDt = models.DateTimeField(null=True, blank=True)
    subject = models.CharField(max_length=100)
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
        return( f"{self.key}")

class Message(models.Model):
    beek = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.CharField(max_length=100)
    body = models.TextField(blank=True, null=True)
    html = models.TextField(blank=True, null=True)
    processed = models.BooleanField(default=False)
    createdDt = models.DateTimeField(default=timezone.now,)
    processedDt = models.DateTimeField(null=True, blank=True)
