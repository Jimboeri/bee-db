# Generated by Django 4.1.7 on 2023-04-09 00:14

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0069_merge_20230215_1135'),
    ]

    operations = [
        migrations.AlterField(
            model_name='diary',
            name='dueDt',
            field=models.DateTimeField(default=datetime.datetime(2023, 4, 16, 0, 14, 48, 274124, tzinfo=datetime.timezone.utc), verbose_name='Date to complete by'),
        ),
    ]
