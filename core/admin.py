from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(customer_registration)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id','name','hotel_name','email','password')

@admin.register(Table)
class Hotel_table(admin.ModelAdmin):
    list_display = ('table_name', 'description', 'hotel_id', 'owner_id', 'menu_id')

@admin.register(Menu)
class Food_item(admin.ModelAdmin):
    list_display = ('food_id', 'food_name', 'description', 'category', 'status', 'hotel_id', 'owner_id')