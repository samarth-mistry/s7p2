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

alt_color = 0

def getLineChartData(request,start_="",end_=""):
    if request.method == "POST":
        start = request.POST['start']
        end = request.POST['end']
    else:
        start = '2021-04-10'
        end = '2022-06-30'
    
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
        start = '2022-04-10'
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
                x_data_list.append(-10)

        color = generate_new_color()
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

def getBarChartData(request,start_="",end_=""):
    if request.method == "POST":
        start = request.POST['start']
        end = request.POST['end']
        item_ids = request.POST.getlist('item_ids[]')
    else:
        start = '2022-04-10'
        end = '2022-06-10'
        item_ids = ["1","4","9","7"]
    
    orders = pd.DataFrame(list(FoodOrder.objects.filter(created_at__gte=start,created_at__lte=end).order_by('created_at').values()))
    data = orders
    data['created_at'] = pd.to_datetime(data['created_at']).dt.strftime("%d %b %y")

    # return HttpResponse(len(orders))
    datasets=[]

    for item_id in item_ids:
        x_data_list = []
        itemObj = FoodItem.objects.get(pk=item_id)
        for data_row in orders.index:
            if item_id == orders["item_id"][data_row]:
                x_data_list.append(str(orders["rate"][data_row]))
            else:
                x_data_list.append(-10)

        color = generate_new_color()
        ds_dict = {
            "label": itemObj.name,
            "data": x_data_list,
            "backgroundColor": color,
            "borderColor": color,
            "borderWidth": 1,
            "fill": False
        }
        datasets.append(ds_dict)

    # if request.method == "POST":
    #     start = request.POST['start']
    #     end = request.POST['end']
    # else:
    #     start = '2022-05-01'
    #     end = '2022-07-01'
    
    # orders = pd.DataFrame(list(FoodOrder.objects.filter(created_at__gte=start,created_at__lte=end).order_by('created_at').values()))
    # orders['created_at'] = pd.to_datetime(orders['created_at']).dt.strftime("%d-%b")

    # c1 = generate_new_color()
    # c2 = generate_new_color()
    # datasets = [{
    #     "label": 'Dataset',
    #     "data": list(orders['rate']),
    #     "backgroundColor": c1,
    #     "borderColor": c1,
    #     "borderWidth": 1,
    #     "fill": False
    # },
    # {
    #     "label": 'DS2',
    #     "data": list(orders['rate']),
    #     "backgroundColor": c2,
    #     "borderColor": c2,
    #     "borderWidth": 1,
    #     "fill": False
    # }]

    final_json = {
        "labels": list(orders['created_at']),
        "datasets": datasets
    }

    return JsonResponse(final_json)

def generate_new_color():
    return 'rgba({a},{b},{c},{d})'.format(a=randrange(0,255),b=randrange(0,255),c=randrange(0,255),d=randrange(10,100,10)/100)\

def generate_alt_color():
    global alt_color
    if  alt_color == 1:
        alt_color = 0
        return 'rgba({a},{b},{c},{d})'.format(a=randrange(0,40),b=randrange(0,40),c=randrange(0,40),d=randrange(10,100,10)/100)
    else:
        alt_color = 1
        return 'rgba({a},{b},{c},{d})'.format(a=randrange(180,255),b=randrange(180,220),c=randrange(0,50),d=randrange(10,100,10)/100)