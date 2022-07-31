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

def auth1(request):
    # return HttpResponse(request.user.is_authenticated)
    if not request.user.is_authenticated:
        return redirect('/')

def logout_view(request):
    logout(request)
    return redirect('/')

def dashboard(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return render(request,'admins/dashboard.html')
        else:
            return redirect('/hotel-dashboard')
    else:
        return redirect('/')

def hotelDashboard(request):
    if request.user.is_authenticated and not request.user.is_superuser:
        return render(request,'h_owners/dashboard.html')
    else:
        return redirect('/')
    
def logins(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST['username']
            password = request.POST['password']
            value = request.POST.get('user_role')
            if value == '1':
                user = User.objects.get(email=username)
                if user.password == password and user.is_superuser == False:
                    login(request,user)
                    return redirect('/hotel-dashboard')
                else:
                    messages.info(request,'Invalid username or password!')
                    return render(request,'login.html')
            elif value =='2':
                pass
            elif value == '3':
                if User.objects.filter(email=username).exists():
                    user  = User.objects.get(email = username)
                    if user.password == password and user.is_superuser == True:
                        customer = User.objects.all().exclude(is_superuser = True)
                        login(request,user)
                        return redirect('/dashboard',user)
                        #return render(request,'admins/dashboard.html',{'customer':customer,'name':user})
                    else:
                        messages.info(request,'Invalid Username or Password')
                        return render(request,'login.html')
                else:
                    messages.info(request,'Invalid username or password!')
                    return render(request,'login.html')
            elif value == '':
                messages.info(request,'Please select role!')
                return render(request,'login.html')
        else:
            return render(request,'login.html')
    else:
        if request.user.is_superuser:
            return redirect('/dashboard')
        else:
            return redirect('/hotel-dashboard')
        
def customer_register(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            name = request.POST['username']
            company_name = request.POST['hotel_name']
            email = request.POST['email']
            pass1 = request.POST['password']
            if User.objects.filter(email=email).exists():
                messages.info(request,'Email already taken')
                return render(request,'h_owners/create.html')
            elif company_name=='admin':
                
                messages.info(request,'Sorry Company Name Not Allowed ')
                return render(request,'h_owners/create.html')
            else:
                reg = User.objects.create_user(username=name, last_name=company_name, email=email)
                reg.set_password(pass1)
                reg.save()
                return redirect('/hotel-owner')
        else:
            customer = CustomerRegistration()
        return render(request,'h_owners/create.html',{'form':customer})
    else:
        return redirect('/')

def admin_register(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            admin = AdminRegistration(request.POST)
            if admin.is_valid():
                name = request.POST['username']
                email = request.POST['email']
                encryptpass= request.POST['password']
                if User.objects.filter(email=email).exists():
                    messages.info(request,'Email already taken')
                    return render(request, 'admins/super_admin_register.html',{'form':admin})
                else:
                    data=User(username=name, email=email, password=encryptpass,last_name='admin')
                    data.is_active = True
                    data.is_staff = True
                    data.is_superuser = True
                    data.save()
                    messages.info(request,'Admin Registered')
                    return redirect('/')
        else:
            admin = AdminRegistration(request.POST)
        return render(request, 'admins/super_admin_register.html',{'form':admin})
    else:
        return redirect('/')

def remove_customer(request,id):
    if request.user.is_authenticated:
        if request.method == "POST":
            cu = User.objects.get(pk=id)
            cu.delete()
            return redirect('/hotel-owner')
    else:
        return redirect('/')

def update_customer(request,id):
    if request.user.is_authenticated:
        if request.method == 'POST':
            pi = User.objects.get(pk=id)
            temp=pi.email
            if request.POST['emailid']==temp:
                name=request.POST['name']
                hotel=request.POST['hotel_name']
                if request.POST['password']=='':
                    User.objects.filter(id=pi.id).update(username=name,last_name=hotel)
                else:
                    User.objects.filter(id=pi.id).update(username=name,last_name=hotel,password=request.POST['password'])
                return redirect('/hotel-owner')
            else:
                messages.info(request,"Can't Change Email")
        pi = User.objects.get(pk=id)
        customer = CustomerRegistration(instance=pi)
        return render(request,'h_owners/edit.html',{'form':customer,'data':pi})
    else:
        return redirect('/')

def view_customer(request,id):
    if request.user.is_authenticated:
        customer = User.objects.get(pk=id)
        return render(request,'h_owners/show.html',{'customer':customer})
    else:
        return redirect('/')

def hotelOwner(request):
    if request.user.is_authenticated:
        customer = User.objects.all().exclude(is_superuser = True).order_by('-id')
        return render(request,'admins/hotel_owners.html',{'customer':customer})
    else:
        return redirect('/')

#-------------------------HOTEL TABLE----------------------
def hotelTable(request):
    tables = HotelTable.objects.all().order_by('-id')
    menu = FoodItem.objects.all().order_by('-id')
    return render(request,'h_owners/h_tables/index.html',{'tables':tables, 'user': request.user, 'menu':menu})

def hotelTableCreate(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            table_name = request.POST['tablename']
            description = request.POST['description']
            data = HotelTable(
                table_name = table_name,
                description = description,
                hotel_id = request.user.id,
                status = None)
            data.save()
            messages.info(request,'Hotel Table Added')
            return redirect('hotel-table')
        else:
            return render(request,'h_owners/h_tables/create.html')
    else:
        return redirect('/')

def hotelTableUpdate(request,id):
    if request.user.is_authenticated:
        if request.method == 'POST':
            table_name=request.POST['tablename']
            description=request.POST['description']
            table = HotelTable.objects.filter(pk=id)
            if table is not None:
                HotelTable.objects.filter(pk=id).update(table_name=table_name,description=description,status=None)
                messages.info(request,'Hotel Table Updated')
            else:
                messages.info(request,'Changes Denied!')
            return redirect('/hotel-table')
        pi = HotelTable.objects.get(pk=id)
        return render(request,'h_owners/h_tables/edit.html',{'data':pi})
    else:
        return redirect('/')

def hotelTableDelete(request,id):
    if request.user.is_authenticated:
        if request.method == 'POST':
            cu = HotelTable.objects.get(pk=id)
            cu.delete()
            return redirect('/hotel-table')
    else:
        return redirect('/')


def hotelTableShow(request,id):
    if request.user.is_authenticated:
        table = HotelTable.objects.get(pk=id)
        owner=User.objects.get(pk=table.hotel_id)
        return render(request,'h_owners/h_tables/show.html',{'table':table,'owner':owner})
    else:
        return redirect('/')

def hotelTableData(request):
    # scandata = query_custom_scan_by_args(**request.query_params)
    # serializers = TaskSerializerScan(scandata['items'], many=True)
    tables = HotelTable.objects.all().order_by('-id')
    data = [table.get_data() for table in tables]

    return HttpResponse(data)
    # response = {
    #         'draw': scandata['draw'],
    #         'recordsTotal': scandata['total'],
    #         'recordsFiltered': scandata['total'],
    #         'data': serializers.data,
    #    }
    response = {
        'draw': 8,
        'recordsTotal': data.count(),
        'recordsFiltered': data.count(),
        'data': data,
    }
    return JsonResponse(response)
#------------------------Food item-----------------------

def foodItem(request):
    # return auth1(request)
    items = FoodItem.objects.all().order_by('-id')
    return render(request,'h_owners/food_items/index.html',{'user': request.user, 'food_items':items})

def foodItemCreate(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            data = FoodItem(
                name = request.POST['name'],
                image = 'pizza.jpeg',
                status = request.POST['status'],
                price = request.POST['price'],
                description = request.POST['description'],
                hotel_id = request.user.id)
            data.save()
            messages.info(request,'Item Added')
            return redirect('food-item')
        else:
            return render(request,'h_owners/food_items/create.html')
    else:
        return redirect('/')

def foodItemUpdate(request,id):
    if request.user.is_authenticated:
        if request.method == 'POST':
            item = FoodItem.objects.filter(pk=id)
            if item is not None:
                FoodItem.objects.filter(pk=id).update(
                    name = request.POST['name'],
                    image = 'pizza.jpeg',
                    status = request.POST['status'],
                    price = request.POST['price'],
                    description = request.POST['description'],
                    hotel_id = request.user.id)

                messages.info(request,'Item Updated')
            else:
                messages.info(request,'Changes Denied!')

            return redirect('/food-item')

        pi = FoodItem.objects.get(pk=id)
        return render(request,'h_owners/food_items/edit.html',{'data':pi})
    else:
        return redirect('/')

def foodItemDelete(request,id):
    if request.user.is_authenticated:
        if request.method == 'POST':
            cu = FoodItem.objects.get(pk=id)
            cu.delete()
            return redirect('/food-item')
    else:
        return redirect('/')

def foodItemShow(request,id):
    if request.user.is_authenticated:
        item = FoodItem.objects.get(pk=id)
        return render(request,'h_owners/food_items/show.html',{'item':item})
    else:
        return redirect('/')

#-----------------------------End user https------------------

def tableMenu(request):
    if 'order_uuid' in request.session:
        order_uuid = request.session['order_uuid']
    else:
        order_uuid = 'order-'+str(uuid.uuid1())
        request.session['order_uuid'] = order_uuid
    
    items = FoodItem.objects.all()
    return render(request,'others/table_menus.html',{'uuid': order_uuid,'items':items})

def tableOrderList(request):
    order_uuid = request.session['order_uuid']
    orders = FoodOrder.objects.filter(number=order_uuid)
    return render(request,'others/table_order_list.html',{'orders': orders})

def tableGenerateBill(request):
    order_uuid = request.session['order_uuid']
    orders = FoodOrder.objects.filter(number=order_uuid)
    amt=0
    for i in orders:
        amt +=i.rate
        
    return render(request,'others/generate_bill.html',{'orders': orders,"amt":amt})

def tablePayment(request):
    stamp = datetime.now()
    stamp = stamp.strftime('%d/%m/%Y')
    qr_code_data = 'http://127.0.0.1:8000/qr/data-url/transaction_uuid/'+stamp
    if 'transaction_uuid' in request.session:
        transaction_uuid = request.session['transaction_uuid']
        transaction_id = transaction_uuid
    else:
        transaction_uuid = 'pym-gw-'+str(uuid.uuid1())
        request.session['transaction_uuid'] = transaction_uuid
        transaction_id=transaction_uuid
        QrCode.objects.create(url=qr_code_data,transaction_id=transaction_id)


    order_uuid = request.session['order_uuid']
    orders = FoodOrder.objects.filter(number=order_uuid)
    amt=0
    for i in orders:
        amt +=i.rate

    data = Payment(
                transaction_id = transaction_uuid,
                qr_code_data = qr_code_data,
                _from = "0",
                _to = "0",
                order_id = order_uuid,
                h_table_id = 1,
                hotel_id = 1,
                discount_amt = "0",
                tax_amt = "18",
                net_amt = amt,
                status = "paid",
                method = "UPI",
                ratings = 5,
                feedback = None,
                description = None)
    data.save()

    qr_code = QrCode.objects.filter(transaction_id=transaction_id)
    return render(request,'others/payment.html',{'transaction_id': transaction_uuid,"amt":amt})

def returnThankYou(request):
    del request.session['order_uuid']
    del request.session['transaction_uuid']
    return render(request,'others/thank_you.html')

def placeOrderAPI(request,uuid,food_id,qun):

    item = FoodItem.objects.get(pk=food_id)
    data = FoodOrder(
                number = uuid,
                item_id = food_id,
                h_table_id = "2",
                hotel_id = "1",
                quantity = qun,
                status = "placed",
                rate = item.price*qun,
                description = None)
    data.save()

    if(True):
        json = {
            "status": True
        }
    else:
        json = {
            "status": False,
            "error": {
                "message": "Something went wrong!",
                "error_code": 502
            }
        }

    return JsonResponse(json)
#-------------------------------------------------------------

def get_album_options():
    return "options", {
        "table": [{'label': obj.table_name, 'value': obj.pk} for obj in HotelTable.objects.all()]
    }
class HotelTableViewSet(viewsets.ModelViewSet):
    queryset = HotelTable.objects.all()
    serializer_class = HotelTableSerializer

    def get_options(self):
        return get_album_options()

    class Meta:
        datatables_extra_json = ('get_options', )


def orderManagementIndex(request):
    raw_orders = FoodOrder.objects.all().order_by('-id')
    _marked = []
    orders=[]
    net_amt=0
    for i in raw_orders:
        if i.number not in _marked:
            orders.append(i)
            _marked.append(i.number)

    cnt=0
    for order in orders:
        for r in raw_orders:
            if r.number == order.number:
                net_amt += r.rate
                order.rate = net_amt
            else:
                net_amt=r.rate

        cnt+=1
            
    return render(request,'h_owners/order_management/index.html',{'orders': orders})

def orderManagementAnalyticMode(request):
    # orders = FoodOrder.objects.all().order_by('-id')
    raw_orders = FoodOrder.objects.all().order_by('-id')
    _marked = []
    orders=[]
    net_amt=0
    for i in raw_orders:
        if i.number not in _marked:
            orders.append(i)
            _marked.append(i.number)

    cnt=0
    for order in orders:
        for r in raw_orders:
            if r.number == order.number:
                net_amt += r.rate
                order.rate = net_amt
            else:
                net_amt=r.rate

        cnt+=1

    marked=[]
    color = 'pink'
    return render(request,'h_owners/order_management/analytic_mode.html',{'raw_orders': raw_orders,'orders':orders,'marked':marked,'color':color})