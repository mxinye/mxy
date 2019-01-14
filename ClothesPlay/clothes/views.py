import hashlib
import random

import time

from django.db.models import Sum
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from clothes.models import User, Good, Wheel1, Cart


# 使用md5加密算法【密码】
def get_md5_pwd(pwd):
    md5 = hashlib.md5()
    md5.update(pwd.encode('utf-8'))
    return md5.hexdigest()

# 使用md5加密算法【令牌】
def get_md5_token():
    token = str(time.time)+str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))
    return md5.hexdigest()


def outer(page):
    def inner(request,*args,**kwargs):
        if request.session.get('token'):
            return page(request,*args,**kwargs)
        else:
            return redirect('clothes:land')

    return inner


# 首页
def index(request):
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.last()
        userimg = user.headimg
        print(user.headimg)
    else:
        userimg = None

    # 获取商品信息
    goods = Good.objects.all()
    wheel1s = Wheel1.objects.all()

    data = {
        'userimg': userimg,
        'goods': goods,
        'wheel1s':wheel1s,
    }

    return render(request,'index.html',context=data)

# 登录
def land(request):
    if request.method =='GET':
        return render(request,'land.html')
    elif request.method =='POST':
        username = request.POST.get('username')
        password = get_md5_pwd(request.POST.get('password'))
        print(username)
        print(password)
        users = User.objects.filter(username=username,password=password)
        if users.count():
            user=users.first()
            user.token = get_md5_token()
            request.session['token'] = user.token
            user.save()

            response = redirect('clothes:index')
            return response
        else:
            err='用户名或密码错误！'
            return render(request,'land.html',context={'err':err})

# 注册
def register(request):
    if request.method=='GET':
        return render(request,'register.html')
    elif request.method=='POST':
        username = request.POST.get('name')
        password = request.POST.get('pwd')

        user = User()
        user.username = username
        user.password = get_md5_pwd(password)
        user.token = get_md5_token()
        user.save()

        request.session['token'] = user.token
        return JsonResponse({'res':0})
# 退出
def logout(request):
    response = redirect('clothes:index')
    request.session.flush()

    return response

# 商品详情
@outer
def gooddetail(request,goodid):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    good = Good.objects.get(pk=goodid)
    cart = Cart.objects.filter(user_id=user.id,good_id=goodid)
    data = {
        'good':good,
        'username':user.username,
        'cart':cart
    }

    return render(request,'Shop.html',data)
# 商品详情
@outer
def gooddetail1(request,wheelid):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    wheel = Wheel1.objects.get(pk=wheelid)

    data = {
        'good':wheel,
        'username':user.username
    }

    return render(request,'Shop.html',data)
# 添加到购物车
@outer
def addgoodcard(request,goodid):
    token = request.session.get('token')
    user_id = User.objects.get(token=token).id

    num = request.GET.get('goodnum')
    good = Good.objects.get(pk=goodid)
    if Cart.objects.filter(user_id= user_id,goodnum=num):
        cart0= Cart.objects.filter(user_id=user_id,good_id=goodid)[0]
        cart0.goodnum = cart0.goodnum+int(num)
        cart0.save()
    else:
        cart = Cart()
        cart.user_id = user_id
        cart.goodname = good.name
        cart.goodnum = num
        cart.goodprice = good.price
        cart.good_id = goodid
        cart.save()
    return JsonResponse({'a':0})
# 购物车
@outer
def card(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)


    goods = Cart.objects.filter(user_id=user.id)
    # {'goodnum__sum': 6}
    goodsnum = Cart.objects.aggregate(Sum('goodnum'))
    # print(goodsnum)
    data ={
        'goods':goods,
        'username':user.username,
        'goodsnum':goodsnum
    }

    return render(request,'SHOP_Cart.html',data)


def ming(request):
    token = request.session.get('token')
    user = User.objects.filter(token=token)[0]

    data = {
        'user':user,
    }


    return render(request,'ming.html',data)

# 同步到数据库，更改
def cartsave(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    goodnum = request.GET.get('goodnum')
    goodid = request.GET.get('goodid')
    cart = Cart.objects.filter(good_id=goodid,user_id=user.id)[0]
    cart.goodnum = goodnum
    cart.save()
    return JsonResponse({'res':0})

# 同步到数据库 ，删除
def cartdelsave(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    goodid = request.GET.get('goodid')
    cart = Cart.objects.filter(good_id=goodid, user_id=user.id)[0]
    cart.delete()
    return JsonResponse({'res':0})

import os,time
def saveimg(request):
    img = request.FILES.get('img')
    imgName = str(int(time.time()))+img.name
    print(imgName)
    f = open(os.path.join('static/img/imgs/', imgName), 'wb')
    for chunk in img.chunks():
        f.write(chunk)
    f.close()

    token = request.session.get('token')
    user = User.objects.get(token=token)

    user.headimg = '/img/imgs/'+img.name
    user.save()
    data = {'user':user}
    return render(request, 'ming.html', data)