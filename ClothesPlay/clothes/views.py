import hashlib
import random

import time
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from clothes.models import User

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

# 首页
def index(request):
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user = users.last()
        username = user.username
    else:
        username = None
    return render(request,'index.html',context={'username':username})

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
        username = request.POST.get('username')
        password = request.POST.get('password')
        password1 = request.POST.get('password1')
        # print(username)
        # print(password)
        # print(password1)
        if (username!="" and password ==password1) and (password !='' and password1 != ''):
            user = User()
            user.username = username
            user.password = get_md5_pwd(password)
            user.token = get_md5_token()
            user.save()

            request.session['token'] = user.token
            response = redirect('clothes:index')
            return response
        else:
            err = '密码不一致或密码不能为空或用户名不能为空'
            return render(request,'register.html',context={'err':err})

def logout(request):
    response = redirect('clothes:index')
    request.session.flush()

    return response













