# Generated by Django 3.2.6 on 2022-02-27 02:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0043_merge_20220215_1310'),
    ]

    operations = [
        migrations.AlterField(
            model_name='diary',
            name='dueDt',
            field=models.DateTimeField(verbose_name='Date to complete by'),
        ),
    ]
