# Generated by Django 3.1 on 2020-08-16 08:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0006_auto_20200816_2055'),
    ]

    operations = [
        migrations.AlterField(
            model_name='inspection',
            name='disease',
            field=models.IntegerField(choices=[(1, 'No disease present'), (3, 'Some disease'), (5, 'Heavy disease infection')], default=0, help_text='How healthy is the hive'),
        ),
        migrations.AlterField(
            model_name='inspection',
            name='eggs',
            field=models.IntegerField(choices=[(1, 'Lots of eggs & larvae, good brood pattern'), (2, 'Lots of eggs & larvae, but spotty brood'), (3, 'Small - reasonable eggs & larvae'), (4, 'A few larvae, no eggs seen'), (5, 'None')], default=0, help_text='How much eggs and larvae is in the hive'),
        ),
        migrations.AlterField(
            model_name='inspection',
            name='numbers',
            field=models.IntegerField(choices=[(1, 'Bees on 20 or more frames'), (2, 'Bees on 10 - 20 frames'), (3, 'bees on 4 - 9 frames'), (4, 'Bees on 3 or less frames'), (5, 'Less than a frame of bees')], default=0, help_text='How many bees in the hive'),
        ),
        migrations.AlterField(
            model_name='inspection',
            name='temper',
            field=models.IntegerField(choices=[(1, 'Calm bees'), (3, 'Bees a bit defensive'), (5, 'Bees attach beekeeper')], default=0, help_text='How happyy is the hive'),
        ),
        migrations.AlterField(
            model_name='inspection',
            name='varroa',
            field=models.IntegerField(choices=[(1, 'No varroa seen'), (2, '1 - 2 varroa'), (3, '3 - 6 varroa'), (4, '7 - 15 varroa'), (5, 'More than 15 varroa')], default=0, help_text='How much varroa is in the hive'),
        ),
        migrations.AlterField(
            model_name='inspection',
            name='weight',
            field=models.IntegerField(choices=[(1, 'Greater than 20 kg'), (2, '15 - 20 kg, plenty of stores'), (3, '10 - 15 kg'), (4, 'Less than 10 kg, hardly any stores'), (5, 'No weight, no stores')], default=0, help_text='How heavy is the hive'),
        ),
    ]
