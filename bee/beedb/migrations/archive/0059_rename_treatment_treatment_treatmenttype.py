# Generated by Django 4.1.2 on 2022-10-26 00:38

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0058_inspection_addtreatment_treatment_postvarroa_and_more"),
    ]

    operations = [
        migrations.RenameField(
            model_name="treatment",
            old_name="treatment",
            new_name="treatmentType",
        ),
    ]
