# Generated by Django 4.1.7 on 2024-07-27 02:31

<<<<<<< HEAD
<<<<<<< HEAD
import beedb.models
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Apiary",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("apiaryID", models.CharField(max_length=50)),
                ("descr", models.TextField(blank=True, null=True)),
                (
                    "latitude",
                    models.DecimalField(decimal_places=7, default=0, max_digits=12),
                ),
                (
                    "longitude",
                    models.DecimalField(decimal_places=7, default=0, max_digits=12),
                ),
                (
                    "ownerResident",
                    models.CharField(
                        blank=True,
                        max_length=200,
                        null=True,
                        verbose_name="Name of owner / occupier",
                    ),
                ),
                (
                    "residentPhone",
                    models.CharField(blank=True, max_length=50, null=True),
                ),
                ("address", models.TextField(blank=True, null=True)),
                (
                    "location",
                    models.TextField(
                        blank=True, help_text="Where the hives are located", null=True
                    ),
                ),
                ("hazards", models.TextField(blank=True, null=True)),
                (
                    "beek",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
            options={
                "ordering": ["apiaryID"],
            },
        ),
        migrations.CreateModel(
            name="Colony",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("colonyID", models.CharField(max_length=50)),
                ("descr", models.TextField(blank=True, null=True)),
                ("notes", models.TextField(blank=True, null=True)),
                (
                    "status",
                    models.CharField(
                        choices=[
                            ("C", "Current"),
                            ("D", "Dead"),
                            ("A", "Absconded"),
                            ("S", "Sold/given"),
                            ("M", "Combined"),
                        ],
                        default="C",
                        help_text="Current status of hive)",
                        max_length=1,
                    ),
                ),
                (
                    "status_dt",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
                (
                    "lastAction",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
                ("queenRight", models.BooleanField(default=True)),
                (
                    "size",
                    models.IntegerField(
                        choices=[
                            (1, "Micro - 3 - mini frames"),
                            (2, "Little - queen castle or nuc"),
                            (3, "Small - single storey brood chamber, 9-10 frames"),
                            (4, "Large - double storey brood chamber, 18 - 20 frames"),
                            (5, "Huge - 3 or more storey brood chamber"),
                        ],
                        default=3,
                        help_text="Size of the colony",
                    ),
                ),
                (
                    "apiary",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="beedb.apiary"
                    ),
                ),
            ],
            options={
                "ordering": ["colonyID"],
            },
        ),
        migrations.CreateModel(
            name="Config",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("key", models.CharField(max_length=500)),
                ("configDt", models.DateTimeField(blank=True, null=True)),
                ("configValue", models.FloatField(blank=True, null=True)),
                (
                    "lastUpdate",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Inspection",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "dt",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
                ("notes", models.TextField(blank=True, null=True)),
                ("numbers", models.IntegerField(default=0)),
                (
                    "eggs",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "Lots of eggs & larvae, good brood pattern"),
                            (2, "Lots of eggs & larvae, but spotty brood"),
                            (3, "Small - reasonable eggs & larvae"),
                            (4, "A few larvae, no eggs seen"),
                            (5, "None"),
                        ],
                        default=0,
                        help_text="How much eggs and larvae is in the hive?",
                    ),
                ),
                (
                    "varroa",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "No varroa seen"),
                            (2, "1 - 2 varroa / 300 bees"),
                            (3, "3 - 6 varroa / 300 bees"),
                            (4, "7 - 15 varroa / 300 bees"),
                            (5, "More than 15 varroa / 300 bees"),
                        ],
                        default=0,
                        help_text="How much varroa is in the hive?",
                    ),
                ),
                ("weight", models.IntegerField(default=0)),
                (
                    "disease",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "No disease present"),
                            (3, "Some disease"),
                            (5, "Heavy disease infection"),
                        ],
                        default=0,
                        help_text="How healthy is the hive?",
                    ),
                ),
                (
                    "temper",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "Calm bees"),
                            (3, "Bees a bit defensive"),
                            (5, "Bees attack beekeeper"),
                        ],
                        default=0,
                        help_text="How happy is the hive?",
                    ),
                ),
                ("queen_seen", models.BooleanField(default=False)),
                ("size", models.IntegerField(blank=True, null=True)),
                (
                    "colony",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="beedb.colony"
                    ),
                ),
            ],
            options={
                "ordering": ["-dt"],
            },
        ),
        migrations.CreateModel(
            name="SizeChoice",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("size", models.IntegerField()),
                ("type", models.CharField(max_length=10)),
                ("value", models.IntegerField()),
                ("text", models.CharField(max_length=40)),
            ],
            options={
                "ordering": ["type", "size", "value"],
            },
        ),
        migrations.CreateModel(
            name="TreatmentType",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=100)),
                ("manufacturer", models.CharField(max_length=100)),
                ("organic", models.BooleanField(default=False)),
                ("requireRemoval", models.BooleanField(default=False)),
                ("daysInHive", models.IntegerField(blank=True, null=True)),
                ("url", models.URLField(blank=True, null=True)),
                ("description", models.TextField()),
                ("instructions", models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name="Treatment",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "completed",
                    models.BooleanField(
                        default=False, verbose_name="Treatment completed & removed"
                    ),
                ),
                (
                    "insertDt",
                    models.DateTimeField(
                        blank=True,
                        default=django.utils.timezone.now,
                        null=True,
                        verbose_name="Date treatment put in",
                    ),
                ),
                (
                    "removeDt",
                    models.DateTimeField(
                        blank=True,
                        null=True,
                        verbose_name="Date treatment to be removed",
                    ),
                ),
                ("trNotes", models.TextField(blank=True, null=True)),
                (
                    "preVarroa",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "No varroa seen"),
                            (2, "1 - 2 varroa / 300 bees"),
                            (3, "3 - 6 varroa / 300 bees"),
                            (4, "7 - 15 varroa / 300 bees"),
                            (5, "More than 15 varroa / 300 bees"),
                        ],
                        default=0,
                        help_text="How much varroa is in the hive before treating?",
                        verbose_name="Varroa count before treatment",
                    ),
                ),
                (
                    "postVarroa",
                    models.IntegerField(
                        choices=[
                            (0, "Not recorded"),
                            (1, "No varroa seen"),
                            (2, "1 - 2 varroa / 300 bees"),
                            (3, "3 - 6 varroa / 300 bees"),
                            (4, "7 - 15 varroa / 300 bees"),
                            (5, "More than 15 varroa / 300 bees"),
                        ],
                        default=0,
                        help_text="How much varroa is in the hive after treating?",
                        verbose_name="Varroa count after treatment",
                    ),
                ),
                (
                    "colony",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="beedb.colony"
                    ),
                ),
                (
                    "inspection",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.inspection",
                    ),
                ),
                (
                    "treatmentType",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="beedb.treatmenttype",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Transfer",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "dt",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
                (
                    "outgoing",
                    models.BooleanField(
                        default=True,
                        help_text="True if colony going to another beekeeper",
                    ),
                ),
                (
                    "transaction",
                    models.IntegerField(
                        default=0,
                        help_text="1 - Sold/given, 2 - Bought/received, 3 - Swarm, 4 - New entry, 5 - Split",
                    ),
                ),
                ("beek_name", models.CharField(blank=True, max_length=50, null=True)),
                (
                    "beek_registration",
                    models.CharField(blank=True, max_length=50, null=True),
                ),
                ("beek_email", models.EmailField(blank=True, max_length=50, null=True)),
                ("beek_phone", models.CharField(blank=True, max_length=50, null=True)),
                ("beek_address", models.TextField(blank=True, null=True)),
                ("notes", models.TextField(blank=True, null=True)),
                (
                    "cost",
                    models.DecimalField(
                        blank=True, decimal_places=2, max_digits=8, null=True
                    ),
                ),
                ("location", models.CharField(blank=True, max_length=200, null=True)),
                (
                    "size",
                    models.IntegerField(
                        default=0,
                        help_text="1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)",
                    ),
                ),
                (
                    "colony",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.colony",
                    ),
                ),
            ],
            options={
                "ordering": ["-dt"],
            },
        ),
        migrations.CreateModel(
            name="Profile",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("phoneNumber", models.CharField(blank=True, max_length=50, null=True)),
                (
                    "reportType",
                    models.CharField(blank=True, default="S", max_length=1, null=True),
                ),
                (
                    "user",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Apiary",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("apiaryID", models.CharField(max_length=50)),
                ("descr", models.TextField(blank=True, null=True)),
                (
                    "beek",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
<<<<<<< HEAD
<<<<<<< HEAD
            name='Diary',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('createdDt', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('startDt', models.DateTimeField(blank=True, null=True)),
                ('dueDt', models.DateTimeField(default=datetime.datetime(2024, 8, 3, 2, 31, 11, 266451, tzinfo=datetime.timezone.utc), verbose_name='Date to complete by')),
                ('notifyDt', models.DateTimeField(blank=True, null=True)),
                ('subject', models.CharField(blank=True, max_length=100, null=True)),
                ('details', models.TextField(blank=True, null=True)),
                ('completed', models.BooleanField(default=False)),
                ('apiary', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='beedb.apiary')),
                ('beek', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('colony', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='beedb.colony')),
=======
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
            name="Diary",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "createdDt",
                    models.DateTimeField(
                        blank=True, default=django.utils.timezone.now, null=True
                    ),
                ),
                ("startDt", models.DateTimeField(blank=True, null=True)),
                (
                    "dueDt",
                    models.DateTimeField(
                        default=datetime.datetime(
                            2024, 8, 3, 2, 31, 11, 266451, tzinfo=datetime.timezone.utc
                        ),
                        verbose_name="Date to complete by",
                    ),
                ),
                ("notifyDt", models.DateTimeField(blank=True, null=True)),
                ("subject", models.CharField(blank=True, max_length=100, null=True)),
                ("details", models.TextField(blank=True, null=True)),
                ("completed", models.BooleanField(default=False)),
                (
                    "apiary",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.apiary",
                    ),
                ),
                (
                    "beek",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
                (
                    "colony",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.colony",
                    ),
                ),
<<<<<<< HEAD
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
            ],
            options={
                "verbose_name": "Project",
                "ordering": ["apiaryID"],
            },
        ),
    ]
