from django.conf.urls import url

from clothes import views

urlpatterns =[
    url(r'^$',views.index,name='index'),
    # 登录
    url(r'^land/$',views.land,name='land'),
    # 注册
    url(r'^register/$',views.register,name='register'),
    # 验证用户名是否存在
    url(r'^checkname/$',views.checkname,name='checkname'),
    # 退出
    url(r'^logout/$',views.logout,name='logout'),
    # 商品详情
    url(r'^gooddetail/(\d+)/$',views.gooddetail,name='gooddetail'),
    # 验证用户是否登录
    url(r'^yangzheng/$', views.yangzheng, name='yangzheng'),
    # 添加商品到购物车
    url(r'^addgoodcard/$',views.addgoodcard,name='addgoodcard'),
    # 购物车页面
    url(r'^cart/$',views.cart,name='cart'),
    #　当购物车里的商品里的数量发生改变
    url(r'^cartsave/$',views.cartsave,name='cartsave'),
    # 购物车里，删除单个
    url(r'^cartdelsave/$',views.cartdelsave,name='cartdelsave'),
    # 购物车里，删除全部
    url(r'^cartdelall/$',views.cartdelall,name='cartdelall'),
    # 购物车里的商品，状态发生改变
    url(r'^cartchangestatus/$',views.cartchangestatus,name='cartchangestatus'),

    url(r'^ming/$',views.ming,name='ming'),

    url(r'^saveimg/$',views.saveimg,name='saveimg'),
    # 生成订单
    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    # 订单详情
    url(r'^order/(.+)/$',views.order,name='order'),
    # 服务器接收到支付宝发来的信号，即支付成功
    url(r'^appnotify/$', views.appnotify, name='appnotify'),
    # 生成支付宝付款链接
    url(r'^pay/$', views.pay, name='pay'),  # 支付
    # 支付成功后客户端跳转的页面
    url(r'^returnview/$', views.returnview, name='returnview'),




]











