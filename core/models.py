from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class customer_registration(models.Model):
    name = models.CharField(max_length=70)
    hotel_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=70)
    password = models.CharField(max_length=70)

class Table(models.Model):
    table_name = models.CharField(max_length=70)
    description = models.CharField(max_length=70)
    hotel_id = models.CharField(max_length=70)
    owner_id = models.CharField(max_length=70)
    menu_id = models.CharField(max_length=70)

class Menu(models.Model):  
    food_id = models.CharField(max_length=70)
    food_name = models.CharField(max_length=70)
    description = models.CharField(max_length=70)
    category = models.CharField(max_length=70)
    status = models.CharField(max_length=70)
    hotel_id = models.CharField(max_length=70)
    owner_id = models.CharField(max_length=70)
