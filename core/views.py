from django.contrib import messages
from django.http import HttpResponseNotModified   
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User,auth
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from .forms import *
from .encrypt_util import *

# Create your views here.

def logout_view(request):
    logout(request)
    return redirect('/')

def dashboard(request):
    customer = User.objects.all().exclude(is_superuser = True)
    return render(request,'admins/dashboard.html',{'customer':customer})

def logins(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST['username']
            password = request.POST['password']
            value = request.POST.get('user_role')
            if value == '1':
                user = User.objects.get(email=username)
                # user = auth.authenticate(email=username , password=password)
                return HttpResponse(user)
                auth.authenticate(user)
                if user is not None:
                    return HttpResponse(password == user.password)
                    if password == user.password:
                        # auth.login(request,user)
                        return render(request,'h_owners/dashboard.html')
            elif value =='2':
                pass
            elif value == '3':
                if User.objects.filter(email=username).exists():
                    user  = User.objects.get(email = username)
                    if user.password == password and user.is_superuser == True:
                        customer = User.objects.all().exclude(is_superuser = True)
                        login(request,user)
                        # return redirect('/dashboard',{'customer':customer,'username':user})
                        return render(request,'admins/dashboard.html',{'customer':customer,'username':user})
                    else:
                        messages.info(request,'Incorrect Password')
                        return render(request,'login.html')
                else:
                    messages.info(request,'Invalid username or password!')
                    return render(request,'login.html')
            elif value == '0':
                messages.info(request,'Please select role!')
                return render(request,'login.html')
        else:
            return render(request,'login.html')
    else:
        logout_view(request)
        return render(request,'login.html')

def customer_register(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            customer = CustomerRegistration(request.POST)
            if customer.is_valid():
                name = customer.cleaned_data['name']
                company_name = customer.cleaned_data['hotel_name']
                email = customer.cleaned_data['email']
                pass1 = customer.cleaned_data['password']
                if User.objects.filter(email=email).exists():
                    messages.info(request,'Email already taken')
                    return render(request,'user-register.html')
                elif company_name=='admin':
                    messages.info(request,'Sorry Company Name Not Allowed ')
                    return render(request,'user-register.html')
                else:
                    reg = User.objects.create_user(username=name, last_name=company_name, email=email)
                    reg.set_password(pass1)
                    reg.save()
                    return redirect('/user-register/')
        else:
            customer = CustomerRegistration()
        return render(request,'user-register.html',{'form':customer})
    else:
        return redirect('hotel-owner')
        # return render(request,'user-register.html')

def admin_register(request):
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

def remove_customer(request,id):
    #if request.user.is_authenticated:
        if request.method == "POST":
            cu = User.objects.get(pk=id)
            cu.delete()
            return redirect('/dashboard')
        else:
            cu=User.objects.get(pk=id)
        customer = User.objects.get(pk=id)
        return render(request,'admins/confirm_delete.html',{'customer':customer})
    #else:
        #return redirect('/dashboard')

def update_customer(request,id):
    #if request.user.is_authenticated:
        if request.method == 'POST':
            pi = User.objects.get(pk=id)
            temp=pi.email
            customer = CustomerRegistration(request.POST, instance=pi)
            if customer.is_valid():
                if request.POST['email']==temp:
                    name=request.POST['name']
                    hotel=request.POST['hotel_name']
                    User.objects.filter(id=pi.id).update(username=name,last_name=hotel)
                    return redirect('/dashboard')
                else:
                    messages.info(request,"Can't Change Email")
        pi = User.objects.get(pk=id)
        customer = CustomerRegistration(instance=pi)
        return render(request,'h_owners/edit.html',{'form':customer})
    #else:
        #return redirect('/dashboard')

def view_customer(request,id):
    #if request.user.is_authenticated:
        customer = User.objects.get(pk=id)
        return render(request,'h_owners/show.html',{'customer':customer})
    #else:
        #return redirect('/dashboard')

def hotelOwner(request):
    customer = User.objects.all().exclude(username='admin@admin.com')
    return render(request,'admins/hotel_owners.html',{'customer':customer})