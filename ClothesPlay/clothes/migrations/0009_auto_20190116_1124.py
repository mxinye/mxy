# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-16 11:24
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('clothes', '0008_auto_20190116_1121'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cart',
            name='good_id',
        ),
        migrations.RemoveField(
            model_name='cart',
            name='user_id',
        ),
        migrations.DeleteModel(
            name='Cart',
        ),
    ]