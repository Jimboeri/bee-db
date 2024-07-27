from django.shortcuts import render
from django.contrib.auth.models import User

# from django.utils.encoding import force_bytes, force_text


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
