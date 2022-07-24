from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(customer_registration)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id','name','hotel_name','email','password')

@admin.register(Table)
class Table(admin.ModelAdmin):
    list_display = ('table_number', 'table_capacity')

@admin.register(Menu)
class Menu(admin.ModelAdmin):
    list_display = ('menu_id','food_item','item_ingredients','food_description')