# Generated by Django 3.0.2 on 2021-01-23 02:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0003_waittime'),
    ]

    operations = [
        migrations.RenameField(
            model_name='waittime',
            old_name='travelling_time',
            new_name='wait_time',
        ),
        migrations.RemoveField(
            model_name='waittime',
            name='location',
        ),
    ]