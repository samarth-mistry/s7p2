from django.contrib import messages
from django.http import HttpResponseNotModified   
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User,auth
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from .forms import *
from .encrypt_util import *
from .models import *

def logout_view(request):
    logout(request)
    return redirect('/')

def dashboard(request):
    if request.user.is_authenticated:
        customer = User.objects.all().exclude(is_superuser = True)
        return render(request,'admins/dashboard.html',{'customer':customer})
    else:
        return redirect('/')

def hotelDashboard(request):
    if request.user.is_authenticated:
        tables = HotelTable.objects.all()
        menu = FoodItem.objects.all()
        return render(request,'h_owners/dashboard.html',{'tables':tables, 'user': request.user, 'menu':menu})
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
                if user is not None and user.check_password(password):
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
        return redirect('/dashboard')
        
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
        customer = User.objects.all().exclude(is_superuser = True)
        return render(request,'admins/hotel_owners.html',{'customer':customer})
    else:
        return redirect('/')

#-------------------------HOTEL TABLE----------------------
def hotelTable(request):
    tables = HotelTable.objects.all()
    menu = FoodItem.objects.all()
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
        owner=User.objects.get(pk=table.owner_id)
        return render(request,'h_owners/h_tables/show.html',{'table':table,'owner':owner})
    else:
        return redirect('/')

def hotelTableData(request):
    scandata = query_custom_scan_by_args(**request.query_params)
    serializers = TaskSerializerScan(scandata['items'], many=True)
    response = {
            'draw': scandata['draw'],
            'recordsTotal': scandata['total'],
            'recordsFiltered': scandata['total'],
            'data': serializers.data,
       }
    return Response(response)
#------------------------Food item-----------------------

def foodItem(request):
    items = FoodItem.objects.all()
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
    return render(request,'others/table_menus.html',{'range': range(10)})

def tableOrderList(request):
    return render(request,'others/table_order_list.html',{'range': range(10)})

def createOrder(request):
    pass

def addItemToOrder(request):
    pass

def tableGenerateBill(request):
    return render(request,'others/generate_bill.html',{'range': range(10)})

def tablePayment(request):
    return render(request,'others/payment.html',{'range': range(10)})

def returnThankYou(request):
    pass


def query_custom_scan_by_args(**kwargs):
    draw = int(kwargs.get('draw')[0])
    length = int(kwargs.get('length')[0])
    start = int(kwargs.get('start')[0])
    search_value = kwargs.get('search[value]')[0]
    order_column = kwargs.get('order[0][column]')[0]
    order = kwargs.get('order[0][dir]')[0]
 
    order_column = SCAN_ORDER_COLUMN_CHOICES[order_column]
    if order == 'desc':
        order_column = '-' + order_column
 
    queryset = HotelTable.objects.all()
 
    if search_value:
        queryset = queryset.filter(Q(name=search_value) |
                               Q(description=search_value) |
                               Q(hotel_id=search_value))
 
    total = queryset.count()
    count = queryset.count()
    queryset = queryset.order_by(order_column)[start:start + length]
    return {
        'items': queryset,
        'count': count,
        'total': total,
        'draw': draw
    }