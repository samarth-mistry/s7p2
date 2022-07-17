from django.contrib import admin
from .models import customer_registration, super_admin

# Register your models here.
@admin.register(customer_registration)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id','name','hotel_name','email','password')

@admin.register(super_admin)
class SuperAdmin(admin.ModelAdmin):
    list_display = ('id','name','email','password')