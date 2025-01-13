"""shop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp import views
from . import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('user_reg/',views.user_reg,name='addusers'),
    path('staff/',views.staffs,name='addstaff'),
    path('loginpage/',views.login_page,name='login_page'),
    path('staff_home/',views.display),
    path('productpage/',views.proadd,name='product_add'),
    path('productview/',views.viewproduct),
    path('delete_pro/<id>',views.delete_pro,name='product_delete'),
    path('update_pro/<int:id>',views.update_pro,name='product_update'),
    path('aromalog/',views.aromalog),
     path('aromareg/',views.aromareg),
    path('',views.index,name='index'),
    path('aromastaff/',views.arostaff),
    path('aromaproadd/',views.aropro),
    path('aromaproview/',views.aroproview),
    path('aromaproupdate',views.aroproupdate),
    path('aromauserpage/',views.aromauser),
    path('singlepro/<id>',views.singlepro,name='singlepro'),
    path('addd_cart/<id>',views.addd_cart,name='addd_cart'),
    path('cartview/',views.cartview),
    path('detail/<str:i>',views.detailview,name='detail'),
    path('delete/<int:id>',views.deletepro,name='delete'),
    path('checkout/',views.checkout,name='order'),
    path('feed_backs/<int:id>',views.feed_backs,name='feed_backs'),
    path('userlogout/',views.userlogout,name='userlogout'),
    path('history/',views.history,name='history'),
    path('wishlist/',views.wishlists),
    path('addwishlist/<int:id>',views.addwishlist,name='addwishlist'),
    path('removewishlist/<int:id>',views.removewishlist,name='removewishlist'),

]+ static(settings.MEDIA_URL,document_root =settings.MEDIA_ROOT)
