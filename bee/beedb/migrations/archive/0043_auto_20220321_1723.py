# Generated by Django 3.2.7 on 2022-03-21 04:23

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):
    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ("beedb", "0042_profile_commslstweeklyemail"),
    ]

    operations = [
        migrations.AlterField(
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(verbose_name="Date to complete by"),
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
                ("status", models.CharField(max_length=1)),
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
    ]
