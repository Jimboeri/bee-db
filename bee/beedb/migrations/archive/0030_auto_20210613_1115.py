# Generated by Django 3.1.5 on 2021-06-12 23:15

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0029_auto_20210418_0930"),
    ]

    operations = [
        migrations.AlterField(
            model_name="apiary",
            name="ownerResident",
            field=models.CharField(
                blank=True,
                max_length=200,
                null=True,
                verbose_name="Name of owner / occupier",
            ),
        ),
    ]
