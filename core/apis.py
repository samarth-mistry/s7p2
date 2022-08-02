from django.contrib import messages
from django.http import HttpResponseNotModified, JsonResponse 
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User,auth
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from .forms import *
from .encrypt_util import *
from .models import *

from rest_framework import viewsets, status
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView

from rest_framework_datatables import pagination as dt_pagination
from rest_framework_datatables.django_filters.filters import GlobalFilter
from rest_framework_datatables.django_filters.filterset import DatatablesFilterSet
from rest_framework_datatables.django_filters.backends import DatatablesFilterBackend

from .serializers import *
import uuid
from datetime import date, datetime
from rolepermissions.roles import assign_role
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
import pandas as pd


def getLineChartData(request,start_="",end_=""):
    if start_=="" and end_=="":
        dt_range = pd.date_range(start='2022-07-10', end='2022-08-10')
    else:
        dt_range = pd.date_range(start=start_, end=end_)
    
    orders = pd.DataFrame(list(FoodOrder.objects.all().order_by('-id').values()))

    vis = [order for in_range in dt_range for order in orders.index if str(in_range).split(" ")[0] == str(orders['created_at'][order]).split(" ")[0]]
    data = orders.iloc[vis]
    data['created_at'] = pd.to_datetime(data['created_at']).dt.strftime("%d-%b")
    json = {
        "lc_x": list(data['rate']),
        "lc_y": list(data['created_at'])
    }
    return JsonResponse(json)