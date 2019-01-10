from django.db import models

# Create your models here.

class User(models.Model):
    username =models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    token = models.CharField(max_length=255)

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'user'

class Good(models.Model):
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10,decimal_places=2)
    old_price = models.DecimalField(max_digits=10,decimal_places=2)
    discount = models.FloatField()
    imgdir = models.CharField(max_length=200)


    def __str__(self):
        return self.name


    class Meta:
        db_table = 'good'






