# Generated by Django 4.1.7 on 2025-02-01 02:51

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='diary',
            name='dueDt',
            field=models.DateTimeField(default=datetime.datetime(2025, 2, 8, 2, 51, 6, 938097, tzinfo=datetime.timezone.utc), verbose_name='Date to complete by'),
        ),
    ]
