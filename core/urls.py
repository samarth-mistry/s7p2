from django.urls import path
from . import views

urlpatterns = [
    # path('', views.home, name='home'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('', views.logins, name='login'),
    path('user-register/', views.register, name='user-register'),
    path('remove_customer/<int:id>/',views.remove_customer,name='remove_customer'),
    path('<int:id>/',views.update_customer,name='update_customer'),
    path('view_customer/<int:id>/',views.view_customer,name='view_customer'),
]