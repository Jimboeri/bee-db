from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.views import generic

from .models import Apiary 

from .forms import ApiaryAddForm

# Create your views here.

@login_required
def index(request):
    print("Run index")
    apList = Apiary.objects.all()
    print(f"Number of apiaries is {len(apList)}")
    context = {"apList": apList, "apiaryactive": "Y"}
    return render(request, "beedb/index.html", context)
    #return HttpResponse("Hello, world. You're at the beedb index.")

@login_required
def apDetail(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    context = {"ap": ap}
    return render(request, "beedb/apDetail.html", context)

def apAdd(request):
    # prj = get_object_or_404(Team, pk=prj_ref)
    print("BP1")
    if request.method == "POST":
        print("Post message received")
        nf = ApiaryAddForm(request.POST)
        if nf.is_valid():
            print("Valid BK 1")
            ap = Apiary(apiaryID=nf.cleaned_data["apiaryID"], descr=nf.cleaned_data["descr"])
            ap.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        print("BP2")
        nf = ApiaryAddForm()

    context = {"form": nf}
    return render(request, "beedb/apAdd.html", context)
