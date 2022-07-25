from django.urls import path
from . import views

urlpatterns = [
    path('dashboard', views.dashboard, name='dashboard'),
    path('logout', views.logout_view, name='logout'),
    path('', views.logins, name='login'),
    path('user-register', views.customer_register, name='user-register'),
    path('super_admin_register', views.admin_register, name='super_admin_register'),
    path('hotel-owner/create',views.customer_register,name='hotel-owner.create'),
    path('hotel-owner/update/<int:id>',views.update_customer,name='hotel-owner.update'),
    path('hotel-owner/delete/<int:id>',views.remove_customer,name='hotel-owner.delete'),
    path('hotel-owner/show/<int:id>',views.view_customer,name='hotel-owner.show'),
    path('hotel-owner',views.hotelOwner,name='hotel-owner'),

    path('hotel-dashboard/',views.hotelDashboard,name='hotel-dashboard'),

    path('hotel-table/create/',views.hotelTableCreate,name='hotel-table.create'),
    path('hotel-table/update/<int:id>',views.hotelTableUpdate,name='hotel-table.update'),
    path('hotel-table/delete/<int:id>',views.hotelTableDelete,name='hotel-table.delete'),
    path('hotel-table/show/<int:id>',views.hotelTableShow,name='hotel-table.show'),
    path('hotel-table',views.hotelTable,name='hotel-table'),

    path('food-item/create',views.foodItemCreate,name='food-item.create'),
    path('food-item/update/<int:id>',views.foodItemUpdate,name='food-item.update'),
    path('food-item/delete/<int:id>',views.foodItemDelete,name='food-item.delete'),
    path('food-item/show/<int:id>',views.foodItemShow,name='food-item.show'),
    path('food-item',views.foodItem,name='food-item'),
    
    path('table-menu',views.tableMenu,name='table-menu'),
    path('table-order-list',views.tableOrderList,name='table-order-list'),
    path('table-generate-bill',views.tableGenerateBill,name='table-generate-bill'),
    path('table-payment',views.tablePayment,name='table-payment'),
]