# Generated by Django 3.1.2 on 2020-12-12 22:26

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0025_auto_20201213_1055"),
    ]

    operations = [
        migrations.AddField(
            model_name="diary",
            name="completed",
            field=models.BooleanField(default=False),
        ),
    ]
