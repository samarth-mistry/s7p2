from django.urls import path
from . import views

urlpatterns = [
    # path('', views.home, name='home'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('logout/', views.logout_view, name='logout'),
    path('', views.logins, name='login'),
    path('user-register/', views.customer_register, name='user-register'),
    path('super_admin_register/', views.admin_register, name='super_admin_register'),
    path('hotel-owner/create/',views.customer_register,name='hotel-owner.create'),
    path('hotel-owner/update/<int:id>/',views.update_customer,name='hotel-owner.update'),
    path('hotel-owner/delete/<int:id>/',views.remove_customer,name='hotel-owner.delete'),
    path('hotel-owner/show/<int:id>/',views.view_customer,name='hotel-owner.show'),
    path('hotel-owner',views.hotelOwner,name='hotel-owner'),
]