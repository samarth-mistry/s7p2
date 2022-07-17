from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class customer_registration(models.Model):
    name = models.CharField(max_length=70)
    hotel_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=70)
    password = models.CharField(max_length=70)

class super_admin(models.Model):
    name = models.CharField(max_length=70)
    email = models.EmailField(max_length=70)
    password = models.CharField(max_length=70)