<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Generated by Django 4.1.7 on 2025-01-28 06:56
=======
# Generated by Django 4.1.7 on 2025-01-28 06:07
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
=======
# Generated by Django 4.1.7 on 2025-01-28 06:07
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
<<<<<<< HEAD
<<<<<<< HEAD

    dependencies = [
        ('beedb', '0001_initial'),
=======
    dependencies = [
        ("beedb", "0001_initial"),
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
=======
    dependencies = [
        ("beedb", "0001_initial"),
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
    ]

    operations = [
        migrations.AlterField(
<<<<<<< HEAD
<<<<<<< HEAD
            model_name='diary',
            name='dueDt',
            field=models.DateTimeField(default=datetime.datetime(2025, 2, 4, 6, 56, 3, 530173, tzinfo=datetime.timezone.utc), verbose_name='Date to complete by'),
=======
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
            model_name="diary",
            name="dueDt",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2025, 2, 4, 6, 7, 55, 363376, tzinfo=datetime.timezone.utc
                ),
                verbose_name="Date to complete by",
            ),
<<<<<<< HEAD
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
=======
>>>>>>> b186e895f2d515af35d199da47ea8675d09e4967
        ),
    ]
