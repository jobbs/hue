# Generated by Django 2.2.1 on 2019-07-28 13:26

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('hue', '0007_roomreservation_signmappingdata'),
    ]

    operations = [
        migrations.AddField(
            model_name='roomreservation',
            name='reserveDate',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
