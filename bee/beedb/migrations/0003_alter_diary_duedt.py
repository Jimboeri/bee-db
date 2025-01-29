# Generated by Django 4.1.7 on 2025-01-28 06:28

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0002_alter_diary_duedt"),
    ]

    operations = [
        migrations.AlterField(
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2025, 2, 4, 6, 28, 55, 497465, tzinfo=datetime.timezone.utc
                ),
                verbose_name="Date to complete by",
            ),
        ),
    ]
