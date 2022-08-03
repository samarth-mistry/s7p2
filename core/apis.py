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
from random import randrange


def getLineChartData(request,start_="",end_=""):
    if request.method == "POST":
        start = request.POST['start']
        end = request.POST['end']
    else:
        start = '2021-04-10'
        end = '2022-12-31'
    
    orders = pd.DataFrame(list(FoodOrder.objects.filter(created_at__gte=start,created_at__lte=end).order_by('created_at').values()))
    data = orders
    # orders = pd.DataFrame(list(FoodOrder.objects.all().order_by('-id').values()))
    # vis = [order for in_range in dt_range for order in orders.index if str(in_range).split(" ")[0] == str(orders['created_at'][order]).split(" ")[0]]
    # data = orders.iloc[vis]
    data['created_at'] = pd.to_datetime(data['created_at']).dt.strftime("%d-%b")
    json = {
        "lc_x": list(data['rate']),
        "lc_y": list(data['created_at'])
    }
    return JsonResponse(json)

def getPieChartData(request):
    pass

def getMultiAreaChartData(request,start_="",end_=""):
    if request.method == "POST":
        start = request.POST['start']
        end = request.POST['end']
        item_ids = request.POST.getlist('item_ids[]')
    else:
        start = '2021-04-10'
        end = '2022-12-31'
        item_ids = ["1","12","9"]
    
    orders = pd.DataFrame(list(FoodOrder.objects.filter(created_at__gte=start,created_at__lte=end).order_by('created_at').values()))
    data = orders
    data['created_at'] = pd.to_datetime(data['created_at']).dt.strftime("%d %b %y")

    ds_list=[]

    for item_id in item_ids:
        x_data_list = []
        itemObj = FoodItem.objects.get(pk=item_id)
        for data_row in orders.index:
            if item_id == orders["item_id"][data_row]:
                x_data_list.append(str(orders["rate"][data_row]))
            else:
                x_data_list.append(0)

        color = 'rgba({a},{b},{c},{d})'.format(a=randrange(0,170),b=randrange(0,170),c=randrange(0,170),d=randrange(10,100,10)/100)
        ds_dict = {
            "label": itemObj.name,
            "data": x_data_list,
            "borderColor": [color],
            "backgroundColor": [color],
            "borderWidth": 1,
            "fill": True
        }
        ds_list.append(ds_dict)

    final_json = {
      "labels": list(orders['created_at']),
      "datasets": ds_list
    }

    return JsonResponse(final_json)