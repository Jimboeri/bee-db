from django.shortcuts import render
from django.contrib.auth.models import User

from django.urls import reverse
from django.utils import timezone
#from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django import forms

from .models import Apiary

# from .forms import (
#    ProfileForm,
#   )


# Create your views here.


def adminMenu(request):
    return render(request, "beedb/admin/adminMenu.html")


def admBeekeepers(request):
    beeks = User.objects.all()
    context = {
        "beeks": beeks,
    }
    return render(request, "beedb/admin/admBeekeepers.html", context)
