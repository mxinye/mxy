# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-11 15:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clothes', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField()),
                ('goodname', models.CharField(max_length=200)),
                ('goodnum', models.IntegerField()),
                ('goodprice', models.DecimalField(decimal_places=2, max_digits=10)),
                ('good_id', models.IntegerField()),
            ],
            options={
                'db_table': 'cart',
            },
        ),
    ]