# Generated by Django 3.2.7 on 2022-03-29 19:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('beedb', '0048_inspection_adddiary'),
    ]

    operations = [
        migrations.CreateModel(
            name='SizeChoice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('size', models.IntegerField()),
                ('type', models.CharField(max_length=10)),
                ('value', models.IntegerField()),
                ('text', models.CharField(max_length=30)),
            ],
        ),
    ]
