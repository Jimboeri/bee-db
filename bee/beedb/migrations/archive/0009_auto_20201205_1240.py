# Generated by Django 3.1.2 on 2020-12-04 23:40

import datetime
from django.db import migrations, models
# from #django.utils.timezone import utc


class Migration(migrations.Migration):
    dependencies = [
        ("beedb", "0008_auto_20200816_2058"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="inspection",
            options={"ordering": ["-dt"]},
        ),
        migrations.AlterField(
            model_name="inspection",
            name="dt",
            field=models.DateTimeField(
                blank=True,
                default=datetime.datetime(
                    2020, 12, 4, 23, 40, 8, 159380, tzinfo=datetime.timezone.utc
                ),
                null=True,
            ),
        ),
        migrations.AlterField(
            model_name="inspection",
            name="numbers",
            field=models.IntegerField(
                choices=[
                    (0, "Not recorded"),
                    (1, "Bees on 20 or more frames"),
                    (2, "Bees on 10 - 20 frames"),
                    (3, "bees on 4 - 9 frames"),
                    (4, "Bees on 3 or less frames"),
                    (5, "Less than a frame of bees"),
                ],
                default=0,
                help_text="How many bees in the hive (seams of bees)",
            ),
        ),
        migrations.AlterField(
            model_name="inspection",
            name="temper",
            field=models.IntegerField(
                choices=[
                    (0, "Not recorded"),
                    (1, "Calm bees"),
                    (3, "Bees a bit defensive"),
                    (5, "Bees attach beekeeper"),
                ],
                default=0,
                help_text="How happy is the hive",
            ),
        ),
    ]
