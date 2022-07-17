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
def dashboard(request):
    customer = User.objects.all().exclude(username='admin@admin.com')
    return render(request,'admin_dasboard.html',{'customer':customer})

def logins(request):
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
            if super_admin.objects.filter(email=username).exists():
                user  = super_admin.objects.get(email = username)
                decryptpass= decrypt(user.password)
                if decryptpass == password:
                    customer = User.objects.all().exclude(username='admin@admin.com')
                    return render(request,'admin_dasboard.html',{'customer':customer})
            else:
                return render(request,'login.html')
    else:
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
            encryptpass= encrypt(request.POST['password'])
            if super_admin.objects.filter(email=email).exists():
                messages.info(request,'Email already taken')
                return render(request,'super_admin_register.html')
            else:
                data=super_admin(name=name, email=email, password=encryptpass)
                data.save()
                return redirect('/dashboard')
    else:
        admin = AdminRegistration(request.POST)
    return render(request, 'super_admin_register.html',{'form':admin})

def remove_customer(request,id):
    if request.user.is_authenticated:
        if request.method == "POST":
            cu = User.objects.get(pk=id)
            cu.delete()
            return redirect('/dashboard')
        else:
            cu=User.objects.get(pk=id)
        customer = User.objects.get(pk=id)
        return render(request,'confirm_delete.html',{'customer':customer})
    else:
        return redirect('/dashboard')

def update_customer(request,id):
    if request.user.is_authenticated:
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
    else:
        return redirect('/dashboard')

def view_customer(request,id):
    if request.user.is_authenticated:
        customer = User.objects.get(pk=id)
        return render(request,'view_customer.html',{'customer':customer})
    else:
        return redirect('/dashboard')
