from django.db import models

# Create your models here.

class User(models.Model):
    username =models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    token = models.CharField(max_length=255)
    headimg = models.CharField(max_length=100,default='img/imgs/desk.jpg')

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'user'

class Base(models.Model):
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10,decimal_places=2)
    old_price = models.DecimalField(max_digits=10,decimal_places=2)
    discount = models.FloatField()
    imgdir = models.CharField(max_length=200)

    class Meta():
        abstract=True

class Good(Base):
    def __str__(self):
        return self.name

    class Meta:
        db_table = 'good'


class Wheel1(Base):
    class Meta:
        db_table = 'wheel1'

class Wheel2(Base):
    class Meta:
        db_table = 'wheel2'
class Wheel3(Base):
    class Meta:
        db_table = 'wheel3'

class Cart(models.Model):
    user_id = models.IntegerField()
    goodname = models.CharField(max_length=200)
    goodnum = models.IntegerField()
    goodprice = models.DecimalField(max_digits=10,decimal_places=2)
    good_id = models.IntegerField()

    class Meta:
        db_table = 'cart'








