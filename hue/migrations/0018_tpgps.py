# Generated by Django 2.2.4 on 2019-11-22 16:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hue', '0017_temphumpm'),
    ]

    operations = [
        migrations.CreateModel(
            name='TpGps',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('deviceUuid', models.CharField(max_length=100)),
                ('deviceLng', models.FloatField(default=None)),
                ('deviceLat', models.FloatField(default=None)),
            ],
        ),
    ]
