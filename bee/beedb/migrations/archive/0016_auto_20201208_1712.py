# Generated by Django 3.1.2 on 2020-12-08 04:12

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0015_apiary_beeknew"),
    ]

    operations = [
        migrations.RenameField(
            model_name="apiary",
            old_name="beek",
            new_name="beekold",
        ),
    ]
