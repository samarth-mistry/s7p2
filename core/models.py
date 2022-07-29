from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class HotelOwner(models.Model):
    name = models.CharField(max_length=70)
    hotel_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=70)
    password = models.CharField(max_length=70)

class HotelTable(models.Model):
    table_name = models.CharField(max_length=70)
    description = models.CharField(max_length=225,null=True,blank=True)
    hotel_id = models.IntegerField()
    status = models.IntegerField(null=True)

    # def get_initial_queryset(self):
	#     qs = super(HotelTable, self).get_initial_queryset()
	#     return qs.filter(manager__isnull=False)

    def get_data(self):
        return {
            'id':self.id,
            'table_name':self.table_name,
            'description':self.description,
            'hotel_id':self.hotel_id,
            'actions':'18'
        }

class FoodCategory(models.Model):  
    name = models.CharField(max_length=70)
    hotel_id = models.IntegerField()
    description = models.CharField(max_length=225,null=True,blank=True)
    status = models.CharField(max_length=20,null=True,blank=True)

class FoodItem(models.Model):  
    name = models.CharField(max_length=70)
    image = models.CharField(max_length=30,null=True)
    description = models.CharField(max_length=225,null=True,blank=True)
    category_id = models.IntegerField(default=1)
    status = models.CharField(max_length=20,null=True,blank=True)
    hotel_id = models.IntegerField()
    price = models.IntegerField()

class FoodOrder(models.Model):  
    number = models.CharField(max_length=70)
    item_id = models.CharField(max_length=30)
    h_table_id = models.IntegerField()
    hotel_id = models.IntegerField()
    quantity = models.IntegerField(default=1)
    status = models.CharField(max_length=20,null=True,blank=True)
    rate = models.IntegerField()
    description = models.CharField(max_length=225,null=True,blank=True)

class Payment(models.Model):  
    transaction_id = models.CharField(max_length=70)
    qr_code_data = models.CharField(max_length=70,null=True,blank=True)
    _from = models.CharField(max_length=30,null=True)
    _to = models.CharField(max_length=30,null=True)
    order_id = models.IntegerField()
    h_table_id = models.IntegerField()
    hotel_id = models.IntegerField()
    discount_amt = models.IntegerField(null=True,blank=True)
    tax_amt = models.IntegerField(null=True,blank=True)
    net_amt = models.IntegerField()
    status = models.CharField(max_length=20,null=True,blank=True)
    method = models.CharField(max_length=30,null=True,blank=True)
    ratings = models.IntegerField()
    description = models.CharField(max_length=225,null=True,blank=True)
    feedback = models.CharField(max_length=225,null=True,blank=True)
