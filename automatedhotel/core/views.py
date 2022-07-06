from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def home(request):
    #return HttpResponse('This Is Home Page Please Add it')
    return render(request,'index.html')

def dashboard(request):
    return render(request,'dashboard.html')

def logins(request):
    return render(request,'login.html')