# Generated by Django 4.1.7 on 2025-01-28 07:15

import beedb.models
import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):
    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ("beedb", "0003_alter_diary_duedt"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="apiary",
            options={"ordering": ["apiaryID"]},
        ),
        migrations.AlterModelOptions(
            name="diary",
            options={"ordering": ["-dueDt"]},
        ),
        migrations.RemoveField(
            model_name="profile",
            name="reportType",
        ),
        migrations.AddField(
            model_name="apiary",
            name="address",
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name="apiary",
            name="hazards",
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name="apiary",
            name="latitude",
            field=models.DecimalField(decimal_places=7, default=0, max_digits=12),
        ),
        migrations.AddField(
            model_name="apiary",
            name="location",
            field=models.TextField(
                blank=True, help_text="Where the hives are located", null=True
            ),
        ),
        migrations.AddField(
            model_name="apiary",
            name="longitude",
            field=models.DecimalField(decimal_places=7, default=0, max_digits=12),
        ),
        migrations.AddField(
            model_name="apiary",
            name="ownerResident",
            field=models.CharField(
                blank=True,
                max_length=200,
                null=True,
                verbose_name="Name of owner / occupier",
            ),
        ),
        migrations.AddField(
            model_name="apiary",
            name="residentPhone",
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="address",
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="bkRegistration",
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="commsInspectionReminder",
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name="profile",
            name="commsLstWeeklyEmail",
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="commsWeeklySummary",
            field=models.BooleanField(
                default=False, verbose_name="Do you want weekly summary emails?"
            ),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectDiaryAdd",
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectHealthIndex",
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectManualIndex",
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectPeriodAutumn",
            field=models.IntegerField(
                default=14, verbose_name="Days between inspections in autumn/fall"
            ),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectPeriodSpring",
            field=models.IntegerField(
                default=7, verbose_name="Days between inspections in spring"
            ),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectPeriodSummer",
            field=models.IntegerField(
                default=14, verbose_name="Days between inspections in summer"
            ),
        ),
        migrations.AddField(
            model_name="profile",
            name="inspectPeriodWinter",
            field=models.IntegerField(
                default=60, verbose_name="Days between inspections in winter"
            ),
        ),
        migrations.AddField(
            model_name="profile",
            name="lastApiary",
            field=models.ForeignKey(
                blank=True,
                help_text="The last apiary selected from the index page",
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="beedb.apiary",
            ),
        ),
        migrations.AlterField(
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2025, 2, 4, 7, 14, 58, 850091, tzinfo=datetime.timezone.utc
                ),
                verbose_name="Date to complete by",
            ),
        ),
        migrations.CreateModel(
            name="Picture",
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
                ("title", models.CharField(max_length=100)),
                ("img", models.ImageField(upload_to=beedb.models.user_directory)),
                ("uploadDt", models.DateTimeField(default=django.utils.timezone.now)),
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
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
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
                (
                    "inspection",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.inspection",
                    ),
                ),
            ],
            options={
                "ordering": ["-uploadDt"],
            },
        ),
        migrations.CreateModel(
            name="Message",
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
                ("subject", models.CharField(max_length=100)),
                ("body", models.TextField(blank=True, null=True)),
                ("html", models.TextField(blank=True, null=True)),
                ("processed", models.BooleanField(default=False)),
                ("createdDt", models.DateTimeField(default=django.utils.timezone.now)),
                ("processedDt", models.DateTimeField(blank=True, null=True)),
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
            name="Feedback",
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
                    "subject",
                    models.CharField(help_text="A short description", max_length=100),
                ),
                (
                    "detail",
                    models.TextField(
                        blank=True, help_text="The detail of your feedback", null=True
                    ),
                ),
                (
                    "feedbackType",
                    models.CharField(
                        choices=[
                            ("F", "General feedback"),
                            ("B", "Bug report (error)"),
                            ("R", "Request a feature"),
                            ("S", "Suggestion"),
                        ],
                        default="F",
                        help_text="What sort of feedback is this?",
                        max_length=1,
                    ),
                ),
                (
                    "status",
                    models.CharField(
                        blank=True,
                        choices=[
                            ("N", "New feedback"),
                            ("I", "Issue raised"),
                            ("A", "Archived"),
                        ],
                        default="N",
                        max_length=1,
                        null=True,
                    ),
                ),
                ("devComment", models.TextField(blank=True, null=True)),
                ("createdDt", models.DateTimeField(default=django.utils.timezone.now)),
                ("lstStatusDt", models.DateTimeField(blank=True, null=True)),
                ("lstCommentDt", models.DateTimeField(blank=True, null=True)),
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
            name="Audit",
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
                ("transaction_cd", models.IntegerField(default=0)),
                ("detail", models.TextField(blank=True, null=True)),
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
                (
                    "colony1",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        related_name="+",
                        to="beedb.colony",
                    ),
                ),
                (
                    "transfer",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="beedb.transfer",
                    ),
                ),
            ],
        ),
    ]
