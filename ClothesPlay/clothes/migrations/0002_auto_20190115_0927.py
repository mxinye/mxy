# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-15 09:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clothes', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='good',
            name='discount',
            field=models.FloatField(null=True),
        ),
    ]
