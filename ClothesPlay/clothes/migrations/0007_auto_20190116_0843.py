# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-16 08:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('clothes', '0006_auto_20190116_0841'),
    ]

    operations = [
        migrations.AlterField(
            model_name='good',
            name='brand_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='clothes.Brand'),
        ),
    ]