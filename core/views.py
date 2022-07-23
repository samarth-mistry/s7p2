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
    customer = User.objects.all().exclude(username='admin@admin.com')
    return render(request,'admin_dasboard.html',{'customer':customer})

def logins(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST['username']
            password = request.POST['password']
            value = request.POST.get('user_role')
            if value == '1':
                user = auth.authenticate(email=username)
                return HttpResponse(user)
                # SOLVE THE BUG HERE!!!!!!!
                if user is not None:
                    auth.login(request,user)
                    return render(request,'customer_dashboard.html')
            elif value =='2':
                pass
            elif value == '3':
                if User.objects.filter(email=username).exists():
                    user  = User.objects.get(email = username)
                    #decryptpass= decrypt(user.password)
                    if user.password == password:
                        customer = User.objects.all().exclude(username='admin@admin.com')
                        customer=customer.exclude(last_name='admin')
                        login(request,user)
                        return render(request,'admin_dasboard.html',{'customer':customer,'username':user})
                    else:
                        messages.info(request,'Incorrect Password')
                        return render(request,'login.html')
                else:
                    messages.info(request,'Invalid Admin')
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
        return render(request,'user-register.html')

def admin_register(request):
    if request.method == 'POST':
        admin = AdminRegistration(request.POST)
        if admin.is_valid():
            name = request.POST['name']
            email = request.POST['email']
            encryptpass= request.POST['password']
            if User.objects.filter(email=email).exists():
                messages.info(request,'Email already taken')
                return render(request, 'super_admin_register.html',{'form':admin})
            else:
                data=User(username=name, email=email, password=encryptpass,last_name='admin')
                data.save()
                messages.info(request,'Admin Registered')
                return redirect('/')
    else:
        admin = AdminRegistration(request.POST)
    return render(request, 'super_admin_register.html',{'form':admin})

def remove_customer(request,id):
    #if request.user.is_authenticated:
        if request.method == "POST":
            cu = User.objects.get(pk=id)
            cu.delete()
            return redirect('/dashboard')
        else:
            cu=User.objects.get(pk=id)
        customer = User.objects.get(pk=id)
        return render(request,'confirm_delete.html',{'customer':customer})
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
        return render(request,'update_customer.html',{'form':customer})
    #else:
        #return redirect('/dashboard')

def view_customer(request,id):
    #if request.user.is_authenticated:
        customer = User.objects.get(pk=id)
        return render(request,'view_customer.html',{'customer':customer})
    #else:
        #return redirect('/dashboard')
