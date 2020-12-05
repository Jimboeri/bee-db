from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.views import generic
from django.urls import reverse

from .models import Apiary, Colony, Inspection

from .forms import ApiaryAddForm, ColonyAddForm, InspectionForm

# Create your views here.


@login_required
def index(request):
    print("Run index")
    apList = Apiary.objects.filter(beek=request.user)
    print(f"Number of apiaries is {len(apList)}")
    context = {"apList": apList, "apiaryactive": "Y"}
    return render(request, "beedb/index.html", context)
    # return HttpResponse("Hello, world. You're at the beedb index.")


@login_required
def apDetail(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    context = {"ap": ap}
    return render(request, "beedb/apDetail.html", context)


@login_required
def apAdd(request):
    # prj = get_object_or_404(Team, pk=prj_ref)
    # print("BP1")
    if request.method == "POST":
        # print("Post message received")
        nf = ApiaryAddForm(request.POST)
        if nf.is_valid():
            print("Valid BK 1")
            ap = Apiary(
                apiaryID=nf.cleaned_data["apiaryID"], descr=nf.cleaned_data["descr"]
            )
            ap.beek = request.user
            ap.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        # print("BP2")
        nf = ApiaryAddForm()

    context = {"form": nf}
    return render(request, "beedb/apAdd.html", context)


@login_required
def apMod(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = ApiaryAddForm(request.POST, instance=ap)
        if nf.is_valid():
            ap.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
        # if a GET (or any other method) we'll create a blank form
    else:
        nf = ApiaryAddForm(instance=ap)

    context = {"form": nf, "ap": ap}
    return render(request, "beedb/apMod.html", context)


@login_required
def colAdd(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    print("BP1")
    if request.method == "POST":
        # print("Post message received")
        nf = ColonyAddForm(request.POST)
        if nf.is_valid():
            print("Valid BK 1")
            col = Colony(
                colonyID=nf.cleaned_data["colonyID"], descr=nf.cleaned_data["descr"]
            )
            col.apiary = ap
            col.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        print("BP2")
        nf = ColonyAddForm()

    context = {"form": nf, "ap": ap}
    return render(request, "beedb/colAdd.html", context)


@login_required
def colDetail(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    context = {"col": col}
    return render(request, "beedb/colDetail.html", context)


@login_required
def colMod(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = ColonyAddForm(request.POST, instance=col)
        if nf.is_valid():
            col.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        print("BP2")
        nf = ColonyAddForm(instance=col)

    context = {"form": nf, "col": col}
    return render(request, "beedb/colMod.html", context)

@login_required
def colMoveChoose(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    apList = Apiary.objects.filter(beek=request.user).exclude(apiaryID=col.apiary.apiaryID)

    context = {"col": col, "apList": apList}
    return render(request, "beedb/colMoveChoose.html", context)

@login_required
def colMoveSelect(request, col_ref, ap_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    ap = get_object_or_404(Apiary, pk=ap_ref)

    if request.method == "POST":
        col.apiary = ap
        col.save()
        return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))

    context = {"col": col, "ap": ap}
    return render(request, "beedb/colMoveSelect.html", context)

@login_required
def inspectDetail(request, ins_ref):
    ins = get_object_or_404(Inspection, pk=ins_ref)
    context = {"ins": ins}
    return render(request, "beedb/inspectDetail.html", context)


@login_required
def inspectMod(request, ins_ref):
    ins = get_object_or_404(Inspection, pk=ins_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = InspectionForm(request.POST, instance=ins)
        if nf.is_valid():
            ins.save()

            return HttpResponseRedirect(reverse("beedb:inspectDetail", args=[ins.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = InspectionForm(instance=ins)

    context = {"form": nf, "ins": ins}
    return render(request, "beedb/inspectMod.html", context)


@login_required
def inspectAdd(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = InspectionForm(request.POST)
        if nf.is_valid():
            ins = nf.save(commit=False)
            ins.colony = col
            ins.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[ins.colony.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = InspectionForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/inspectAdd.html", context)

@login_required
def inspectDel(request, ins_ref):
    ins = get_object_or_404(Inspection, pk=ins_ref)
    col = ins.colony
    if request.method == "POST":
        ins.delete()
        return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))
    else:
        context = {"ins": ins}
    return render(request, "beedb/inspectDelete.html", context)
