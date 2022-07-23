from django.urls import path
from . import views

urlpatterns = [
    # path('', views.home, name='home'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('logout/', views.logout_view, name='logout'),
    path('', views.logins, name='login'),
    path('user-register/', views.customer_register, name='user-register'),
    path('super_admin_register/', views.admin_register, name='super_admin_register'),
    path('remove_customer/<int:id>/',views.remove_customer,name='remove_customer'),
    path('<int:id>/',views.update_customer,name='update_customer'),
    path('view_customer/<int:id>/',views.view_customer,name='view_customer'),
    path('hotel-owner',views.hotelOwner,name='hotel-owner'),
]