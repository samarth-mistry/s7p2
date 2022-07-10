from django.contrib import messages   
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from .forms import *
from .models import customer_registration

# Create your views here.
def dashboard(request):
    customer = User.objects.all().exclude(username='admin@admin.com')
    return render(request,'admin_dasboard.html',{'customer':customer})

def logins(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST['username']
            password = request.POST['password']
            if password == 'admin1234' and username == 'admin@admin.com':
                customer = User.objects.all().exclude(username='admin@admin.com')
                return render(request,'admin_dasboard.html',{'customer':customer})
            else:
                return render(request,'login.html')
        else:
            return render(request,'login.html')
    else:
        return render(request,'login.html')

def register(request):
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
                    reg = User.objects.create_user(username=name, last_name=company_name, email=email, password=pass1)
                    reg.save()
                    return redirect('/user-register/')
        else:
            customer = CustomerRegistration()
        return render(request,'user-register.html',{'form':customer})
    else:
        return render(request,'user-register.html')

def remove_customer(request,id):
    if request.user.is_authenticated:
        if request.method == "POST":
            cu = User.objects.get(pk=id)
            cu.delete()
            return redirect('/admin_dashboard')
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
