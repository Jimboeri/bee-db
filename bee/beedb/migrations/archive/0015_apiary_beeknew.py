# Generated by Django 3.1.2 on 2020-12-07 23:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0014_auto_20201208_1107"),
    ]

    operations = [
        migrations.AddField(
            model_name="apiary",
            name="beeknew",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="beedb.beek",
            ),
        ),
    ]
