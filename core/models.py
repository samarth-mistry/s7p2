from msilib import Table
from django.db import models
from django.contrib.auth.models import User
from matplotlib.pyplot import table

# Create your models here.
class customer_registration(models.Model):
    name = models.CharField(max_length=70)
    hotel_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=70)
    password = models.CharField(max_length=70)

class Table(models.Model):
    table_number = models.IntegerField()
    table_capacity = models.IntegerField()

class Menu(models.Model):
    menu_id = models.OneToOneField(Table, on_delete=models.CASCADE)
    food_item = models.CharField(max_length=30)
    item_ingredients = models.CharField(max_length=50)
    food_description = models.CharField(max_length=50)