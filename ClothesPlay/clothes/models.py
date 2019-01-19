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

class Brand(models.Model):
    img = models.CharField(max_length=200)

    class Meta:
        db_table = 'brand'

class Big(models.Model):
    img = models.CharField(max_length=200)
    class Meta:
        db_table = 'big'

class Good(models.Model):
    # 商品
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10,decimal_places=2)
    old_price = models.DecimalField(max_digits=10,decimal_places=2,null=True)
    discount = models.FloatField(null=True)
    imgdir = models.CharField(max_length=200)
    # 品牌
    brand_id = models.ForeignKey(Brand,null=True)
    # 大图
    big_id = models.ForeignKey(Big,null=True)
    # 类别
    category_id = models.IntegerField(null=True)

    class Meta:
        db_table = 'good'

# class Base(models.Model):
#     name = models.CharField(max_length=100)
#     price = models.DecimalField(max_digits=10,decimal_places=2)
#     old_price = models.DecimalField(max_digits=10,decimal_places=2)
#     discount = models.FloatField()
#     imgdir = models.CharField(max_length=200)
#
#     class Meta():
#         abstract=True
#
# class Good(Base):
#     def __str__(self):
#         return self.name
#
#     class Meta:
#         db_table = 'good'
#
#
# class Wheel1(Base):
#     class Meta:
#         db_table = 'wheel1'
#
# class Wheel2(Base):
#     class Meta:
#         db_table = 'wheel2'
# class Wheel3(Base):
#     class Meta:
#         db_table = 'wheel3'
#
class Cart(models.Model):
    user = models.ForeignKey(User)
    goodnum = models.IntegerField()
    goodcolor = models.CharField(max_length=20)
    goodsize = models.CharField(max_length=20)
    good = models.ForeignKey(Good)
    isselect = models.BooleanField(default=True)
    class Meta:
        db_table = 'cart'

class Base(models.Model):
    name = models.CharField(max_length=200)
    img = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10,decimal_places=2)
    class Meta:
        abstract=True


class Woman(Base):
    class Meta:
        db_table = 'woman'

class Man(Base):
    class Meta:
        db_table = 'man'

class Child(Base):
    class Meta:
        db_table = 'child'


class Order(models.Model):
    # 用户
    user = models.ForeignKey(User)
    # 状态
    # 0 未付款
    # 1 已付款
    status = models.IntegerField(default=0)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 订单号
    identifier = models.CharField(max_length=256)

    class Meta:
        db_table = 'order'



# 订单商品 模型类
# 一个订单 对应 多个商品
class OrderGood(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    good = models.ForeignKey(Good)
    # 商品规格
    number = models.IntegerField()

    size = models.CharField(max_length=20)

    color = models.CharField(max_length=20)

    class Meta:
        db_table = 'ordergood'




