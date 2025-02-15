# Generated by Django 5.1.6 on 2025-02-15 02:39

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0001_initial"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="diary",
            options={"ordering": ["-dueDt"]},
        ),
        migrations.AlterModelOptions(
            name="inspection",
            options={"ordering": ["-dt"]},
        ),
        migrations.AlterField(
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2025, 2, 22, 2, 39, 9, 776108, tzinfo=datetime.timezone.utc
                ),
                verbose_name="Date to complete by",
            ),
        ),
    ]
