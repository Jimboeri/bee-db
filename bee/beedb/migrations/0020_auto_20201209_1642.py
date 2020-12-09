# Generated by Django 3.1.2 on 2020-12-09 03:42

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('beedb', '0019_apiary_beeknew1'),
    ]

    operations = [
        migrations.RenameField(
            model_name='apiary',
            old_name='beek',
            new_name='beekold1',
        ),
        migrations.AlterField(
            model_name='apiary',
            name='beeknew1',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auth.user'),
        ),
    ]
