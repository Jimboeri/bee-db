# Generated by Django 3.1.2 on 2020-12-08 04:13

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0016_auto_20201208_1712"),
    ]

    operations = [
        migrations.RenameField(
            model_name="apiary",
            old_name="beeknew",
            new_name="beek",
        ),
    ]
