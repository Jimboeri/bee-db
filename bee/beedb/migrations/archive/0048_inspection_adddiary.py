# Generated by Django 3.2.7 on 2022-03-25 06:52

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0047_auto_20220325_1700"),
    ]

    operations = [
        migrations.AddField(
            model_name="inspection",
            name="addDiary",
            field=models.BooleanField(default=False, help_text="Add a reminder?"),
        ),
    ]
