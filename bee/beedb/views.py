from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.views import generic

from .models import Apiary 

# Create your views here.

@login_required
def index(request):
    print("Run index")
    apList = Apiary.objects.all()
    print(f"Number of apiaries is {len(apList)}")
    context = {"apList": apList, "apiaryactive": "Y"}
    return render(request, "beedb/index.html", context)
    #return HttpResponse("Hello, world. You're at the beedb index.")

