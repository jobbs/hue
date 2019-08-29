# Generated by Django 2.2.1 on 2019-08-03 21:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hue', '0008_roomreservation_reservedate'),
    ]

    operations = [
        migrations.CreateModel(
            name='HueEdges',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('parkId', models.CharField(max_length=5)),
                ('fromSeqId', models.IntegerField(default=None)),
                ('toSeqId', models.IntegerField(default=None)),
                ('arrows', models.CharField(max_length=5)),
            ],
        ),
        migrations.CreateModel(
            name='HueNodes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('parkId', models.CharField(max_length=5)),
                ('seqId', models.IntegerField(default=None)),
                ('type', models.CharField(max_length=5)),
                ('roomid', models.IntegerField(blank=True, default=None, null=True)),
                ('x', models.IntegerField(default=None)),
                ('y', models.IntegerField(default=None)),
                ('label', models.CharField(max_length=100)),
                ('shape', models.CharField(max_length=10)),
                ('image', models.CharField(blank=True, max_length=500, null=True)),
                ('size', models.IntegerField(blank=True, default=None, null=True)),
            ],
        ),
    ]
