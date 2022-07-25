from django.contrib import messages
from django.http import HttpResponseNotModified   
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User,auth
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from .forms import *
from .encrypt_util import *

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
        tables = Table.objects.all()
        menu = Menu.objects.all()
        return render(request,'h_owners/dashboard.html',{'tables':tables, 'user': request.user, 'menu':menu})
        return HttpResponse("dh1")

    else:
        return HttpResponse("d3d    3h")
        return redirect('/')
    
def logins(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST['username']
            password = request.POST['password']
            value = request.POST.get('user_role')
            if value == '1':
                user = User.objects.get(email=username)
                # user = auth.authenticate(email=username , password=password)
                auth.authenticate(user)
                if user is not None:
                    tables = Table.objects.all()
                    menu = Menu.objects.all()
                    return render(request,'h_owners/dashboard.html',{'tables':tables, 'user': user, 'menu':menu})
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
                User.objects.filter(id=pi.id).update(username=name,last_name=hotel)
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
    pass

def hotelTableCreate(request):
    pass

def hotelTableUpdate(request):
    pass

def hotelTableDelete(request):
    pass

def hotelTableShow(request):
    pass

#------------------------Table Food item-----------------------

def foodItem(request):
    pass

def foodItemCreate(request):
    pass

def foodItemUpdate(request):
    pass

def foodItemDelete(request):
    pass

def foodItemShow(request):
    pass

#-----------------------------End user https------------------

def tableMenu(request):
    return render(request,'others/table_menus.html',{'range': range(10)})

def tableOrderList(request):
    return render(request,'others/table_order_list.html',{'range': range(10)})

def createOrder(request):
    pass

def addItemToOrder(request):
    pass

def generateBill(request):
    pass

def createPayment(request):
    pass

def returnThankYou(request):
    pass

