# Generated by Django 4.1.2 on 2022-11-04 23:07

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0063_rename_notes_treatment_trnotes"),
    ]

    operations = [
        migrations.AlterField(
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2022, 11, 11, 23, 7, 26, 761600, tzinfo=datetime.timezone.utc
                ),
                verbose_name="Date to complete by",
            ),
        ),
    ]
