import hashlib
import random

import os,time

from django.db.models import Sum
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from clothes.alipay import alipay
from clothes.models import User, Good, Brand, Big, Woman, Man, Child, Cart, Order, OrderGood


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
    try:
        token = request.session.get('token')
        user = User.objects.get(token=token)
        username = user.username
    except:
        username = None

    # 获取商品信息
    goods = Good.objects.all()
    brands = Brand.objects.all()
    bigs = Big.objects.all()
    womans = Woman.objects.all()
    mans = Man.objects.all()
    childs = Child.objects.all()

    data = {
        'goods': goods,
        'brands':brands,
        'bigs':bigs,
        'username':username,
        'womans':womans,
        'mans':mans,
        'childs':childs,

    }
    return render(request,'index.html',context=data)
#
# 登录
def land(request):
    if request.method =='GET':
        return render(request,'land.html')
    elif request.method =='POST':
        username = request.POST.get('username')
        password = get_md5_pwd(request.POST.get('password'))
        try:
            user = User.objects.get(username=username)
            if user.password==password:
                user.token = get_md5_token()
                request.session['token'] = user.token
                user.save()

                response = redirect('clothes:index')
                return response
            else:
                err = '密码错误！'
        except:
            err = '用户名不存在！'

        return render(request, 'land.html', context={'err': err})

# 在注册页面验证用户名是否存在
def checkname(request):
    username = request.GET.get('user')
    try:
        user = User.objects.get(username=username)
        res = 0
    except:
        res = 1
    return JsonResponse({'res':res})

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
#
# # 商品详情

def gooddetail(request,goodid):
    good = Good.objects.get(pk=goodid)
    goodsames = Good.objects.filter(category_id=good.category_id).exclude(id=goodid)
    if request.session.get('token'):
        token = request.session.get('token')
        user = User.objects.get(token=token)
        username = user.username
        try:
            cart = Cart.objects.filter(good_id=good.id, user_id=user.id).aggregate(Sum('goodnum'))
            print(cart)
        except:
            cart = None
    else:
        username = None
        cart = None
    data = {
        'good': good,
        'username': username,
        'cart': cart,
        'goodsames': goodsames,
    }

    return render(request, 'Shop.html', data)

# 在添加购物时验证是否登录
def yangzheng(request):
    if request.session.get('token'):
        status = 1
    else:
        status = 0
    return JsonResponse({'status':status})

#添加到购物车
@outer
def addgoodcard(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    num = request.GET.get('goodnum')
    color = request.GET.get('goodcolor')
    size = request.GET.get('goodsize')
    goodid = request.GET.get('goodid')
    good = Good.objects.get(pk=goodid)

    if Cart.objects.filter(user= user,good=good,goodcolor=color,goodsize=size).count()!=0:
        cart= Cart.objects.get(user=user,good=good,goodcolor=color,goodsize=size)
        cart.goodnum = cart.goodnum+int(num)
        cart.save()
    else:
        cart = Cart()
        cart.user = user
        cart.goodcolor = color
        cart.goodnum = num
        cart.goodsize = size
        cart.good = good
        cart.save()
    return JsonResponse({'a':0})
# 购物车
@outer
def cart(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    goods = Cart.objects.filter(user_id=user.id).exclude(goodnum=0)
    # {'goodnum__sum': 6}
    goodsum = Cart.objects.filter(user_id=user.id).exclude(goodnum=0).aggregate(Sum('goodnum'))
    print(goodsum)
    data ={
        'goods':goods,
        'username':user.username,
        'goodsum':goodsum,
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
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.goodnum = goodnum
    cart.save()
    return JsonResponse({'res':0})

# 同步到数据库 ，删除
def cartdelsave(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.goodnum=0
    cart.save()
    return JsonResponse({'res':0})


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

# 购物车里，删除全部
def cartdelall(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    Cart.objects.filter(user=user).update(goodnum=0)

    return JsonResponse({'status':1})

# 购物车里的商品，状态发生改变
def cartchangestatus(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    cartid = request.GET.get('cartid')
    isselect = request.GET.get('isselect')

    cart = Cart.objects.get(pk=cartid)

    if isselect=='false':
        isselect = False
    elif isselect == 'true':
        isselect = True
    cart.isselect = isselect
    cart.save()
    return JsonResponse({'status':1})

# 随机生成订单编号
def generate_identifire():
    tempstr = str(int(time.time())) + str(random.random())
    return tempstr

# 生成订单
def generateorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifire()
    order.save()
    print('22222')
    # 订单商品
    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(goodnum=0)
    # 只有选中的商品，才是添加到订单中，从购物车中删除
    if carts.count()==0:
        status = 0

    else:
        for cart in carts:
            orderGood = OrderGood()
            orderGood.order = order
            orderGood.good = cart.good
            orderGood.number = cart.goodnum
            orderGood.color = cart.goodcolor
            orderGood.size = cart.goodsize
            orderGood.save()

            cart.delete()

        status = 1

            # 从购物车中删除


    data = {
        'status': status,
        'identifier': order.identifier
    }
    return JsonResponse(data)

# 订单页面
def order(request,identifier):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    order = Order.objects.get(identifier=identifier)
    return render(request,'order.html',context={'order':order,'username':user.username})


# 生成支付宝付款链接
def pay(request):
    identifier = request.GET.get('identifier')
    order = Order.objects.get(identifier=identifier)

    sum = 0
    for orderGood in order.ordergood_set.all():
        sum += orderGood.good.price * orderGood.number

    # 支付地址
    url = alipay.direct_pay(
        subject='MacBookPro - 2019款',  # 支付宝页面显示的标题
        out_trade_no=identifier,  # AXF订单编号
        total_amount=str(sum),  # 订单金额
        return_url='http://112.74.55.3/returnview/'
    )

    # 拼接上支付网关
    alipayurl = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipayurl': alipayurl, 'status': 1})

#　收到支付宝发来的信号后，执行
@csrf_exempt
def appnotify(request):
    # http://112.74.55.3/returnview/?charset=utf-8&out_trade_no=15477988300.6260414050156342&method=alipay.trade.page.pay.return&total_amount=93.00&sign=oaTJZPDeswBfEbQGkBND8w8DDOWGMdz8lw6TlL25Sp73TZtTBqUBx2vazVi5sI6pFLSgfF%2FRsxsiY20S5UzZeCJ5hfrGXp4NCg6ZpZE%2FWS1CsMnI74lO%2F8ttTx1j%2FzfhrJJuTIHJ503Z1wiDZoXHer91ynI%2FCTLn8W0de2fVhnBi5hTo7MJHJBZQnVQ%2BnFJ73cKBB16xdIJ15ISVUrYYi%2FUGJr2jh%2BllGiiTVm4o0maDuYH3ljuGVxAI4yvP%2BevAfo7B2MK%2F1BW3%2FVu8JRLatEIqeyV2Qk87%2F%2FGRndFRjRDuuZMU8zzix0eg0oKYVeBmfOnRPXhMFAs8dGPedC1D2Q%3D%3D&trade_no=2019011822001416700501217055&auth_app_id=2016091800542542&version=1.0&app_id=2016091800542542&sign_type=RSA2&seller_id=2088102176233911&timestamp=2019-01-18+16%3A08%3A08

    # 获取订单号，并且修改订单状态
    if request.method == 'POST':
        from urllib.parse import parse_qs
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dir = {}

        print(body_str)
        print(post_data)
        print(post_data.items())
        for key, value in post_data.items():
            post_dir[key] = value[0]

        out_trade_no = post_dir['out_trade_no']
        print(out_trade_no)

        # 更新状态
        Order.objects.filter(identifier=out_trade_no).update(status=1)

        return JsonResponse({'msg': 'success'})


# 支付成功后客户端跳转的页面
def returnview(request):
    return render(request,'SHOP_Cart.html')


