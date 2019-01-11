from django.conf.urls import url

from clothes import views

urlpatterns =[
    url(r'^$',views.index,name='index'),
    url(r'^land/$',views.land,name='land'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^gooddetail/(\d+)$',views.gooddetail,name='gooddetail'),
    url(r'^gooddetail1/(\d+)$',views.gooddetail1,name='gooddetail1'),
    url(r'^addgoodcard/(\d+)$',views.addgoodcard,name='addgoodcard'),
    url(r'^cart/(\d+)$',views.card,name='card'),


]











