# Generated by Django 3.1.4 on 2021-08-04 06:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0031_config'),
    ]

    operations = [
        migrations.AddField(
            model_name='colony',
            name='notes',
            field=models.TextField(blank=True, null=True),
        ),
    ]
