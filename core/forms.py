from django import forms
from .models import *

class CustomerRegistration(forms.ModelForm):
    class Meta:
        model = customer_registration
        fields = ('name','hotel_name','email','password')
        widgets = {
        'name' : forms.TextInput(attrs={'class':'form-control'}),
        'hotel_name' : forms.TextInput(attrs={'class':'form-control'}),
        'email' : forms.EmailInput(attrs={'class':'form-control'}),
        'password' : forms.PasswordInput(render_value=True, attrs={'class':'form-control'}),
        }
