from django.conf.urls import url

from clothes import views

urlpatterns =[
    url(r'^$',views.index,name='index'),
    url(r'^land/$',views.land,name='land'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^gooddetail/(\d+)$',views.gooddetail,name='gooddetail'),


]











