# Generated by Django 3.2.7 on 2022-04-08 01:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0054_auto_20220403_1100'),
    ]

    operations = [
        migrations.AddField(
            model_name='inspection',
            name='size',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
