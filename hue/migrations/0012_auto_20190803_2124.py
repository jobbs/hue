# Generated by Django 2.2.1 on 2019-08-03 21:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hue', '0011_delete_user'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='HueEdges',
            new_name='Edges',
        ),
        migrations.RenameModel(
            old_name='HueNodes',
            new_name='Nodes',
        ),
    ]
