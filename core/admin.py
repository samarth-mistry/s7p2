from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(HotelOwner)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id','name','hotel_name','email','password')

@admin.register(HotelTable)
class HotelTable(admin.ModelAdmin):
    list_display = ('id','table_name', 'description', 'hotel_id', 'status')

@admin.register(FoodCategory)
class FoodCategory(admin.ModelAdmin):
    list_display = ('id','name', 'hotel_id', 'description', 'status')

@admin.register(FoodItem)
class FoodItem(admin.ModelAdmin):
    list_display = ('id','name', 'image', 'description', 'category_id', 'status', 'hotel_id', 'price')

@admin.register(FoodOrder)
class FoodOrder(admin.ModelAdmin):
    list_display = ('number', 'item_id', 'h_table_id', 'hotel_id', 'quantity', 'status', 'rate','description')

@admin.register(Payment)
class Payment(admin.ModelAdmin):
    list_display = ('transaction_id', 'qr_code_data', '_from', '_to', 'order_id', 'h_table_id', 'hotel_id','discount_amt','tax_amt','net_amt','status','method','ratings','description','feedback')