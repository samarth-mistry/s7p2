from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(customer_registration)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id','name','hotel_name','email','password')