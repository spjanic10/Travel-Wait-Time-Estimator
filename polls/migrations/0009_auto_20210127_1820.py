# Generated by Django 3.0.2 on 2021-01-27 18:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0008_delete_rental'),
    ]

    operations = [
        migrations.RenameField(
            model_name='waittime',
            old_name='destination',
            new_name='address',
        ),
    ]
