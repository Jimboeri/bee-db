from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
import datetime

# Create your models here.



class Beek(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    bkRegistration = models.CharField(max_length=10, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    name = models.CharField(max_length=100)
    email = models.EmailField(blank=True, null=True)

    def __str__(self):
        return self.name


class Apiary(models.Model):
    """
    """

    beek = models.ForeignKey(Beek, on_delete=models.SET_NULL, null=True, blank=True)
    apiaryID = models.CharField(max_length=50)
    descr = models.TextField(blank=True, null=True)

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

    def __str__(self):
        return self.user.username


class Colony(models.Model):
    STATUS_CHOICES = [
        ("C", "Current"),
        ("D", "Dead"),
        ("A", "Absconded"),
    ]
    apiary = models.ForeignKey(Apiary, on_delete=models.CASCADE)
    colonyID = models.CharField(max_length=50)
    descr = models.TextField(blank=True, null=True)
    status = models.CharField(
        max_length=1,
        help_text="Current status of hive)",
        choices=STATUS_CHOICES,
        default="C",
    )

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
