# Generated by Django 3.2.7 on 2022-03-22 22:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0043_auto_20220321_1723'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feedback',
            name='status',
            field=models.CharField(blank=True, default='N', max_length=1, null=True),
        ),
    ]
