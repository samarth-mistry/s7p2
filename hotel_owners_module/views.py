from django.contrib import messages
from django.http import HttpResponseNotModified, JsonResponse 
from django.shortcuts import render
from django.shortcuts import redirect,reverse,render,HttpResponse,HttpResponseRedirect
from django.contrib.auth.models import User,auth
from django.core.mail import EmailMessage
from django.contrib.auth import login, logout, authenticate
from core.forms import *
from core.encrypt_util import *
from core.models import *

import uuid
from datetime import date, datetime

def testingFunction(request):
    return True