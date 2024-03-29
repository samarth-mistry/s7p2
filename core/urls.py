from django.urls import path, include
from . import views
from . import apis
from . import forecast_ai
# from hotel_owners_module. import h_views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'hotel-table', views.HotelTableViewSet)

urlpatterns = [
    path('api-data/', include(router.urls)),
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
    path('hotel-table/data1',views.hotelTableData,name='hotel-table.data'),
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
    path('payment-done',views.returnThankYou,name='payment-done'),

    path('place-order/<str:uuid>/<int:food_id>/<int:qun>',views.placeOrderAPI,name='place-order'),

    path('order-management',views.orderManagementIndex,name='order-management'),
    path('order-management/analytic-mode',views.orderManagementAnalyticMode,name='order-management.analytic-mode'),
    path('analytics/<str:type>',views.analyticsIndex,name='analytics'),

    path('forecast',views.forecastIndex,name='forecast'),

    path('api/get-barchart-data',apis.getBarChartData,name='api.get-barchart-data'),
    path('api/get-multiareachart-data',apis.getMultiAreaChartData,name='api.get-multiareachart-data'),
    path('api/get-multiareachart-data/<str:start_>/<str:end_>)',apis.getMultiAreaChartData),
    path('api/get-linechart-data',apis.getLineChartData,name='api.get-linechart-data'),
    path('api/get-linechart-data/<str:start_>/<str:end_>)',apis.getLineChartData,kwargs={'start_': None,'end_': None}),

    path('api/get-forecast',forecast_ai.get,name='api.get-forecast'),
]