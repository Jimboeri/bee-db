from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.tokens import default_token_generator
from django.contrib import auth, messages
from django.views import generic
from django.urls import reverse
from django.utils import timezone
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django import forms

from .models import Apiary, Colony, Inspection, Transfer, Audit, Diary

from .forms import (
    ApiaryAddForm,
    ColonyAddForm,
    ColonyDeadForm,
    InspectionForm,
    TransferForm,
    SwarmForm,
    PurchaseForm,
    ColonyModelForm,
    DiaryModelForm,
    DiaryForm,
    CustomUserCreationForm,
)

import datetime

# Create your views here.


@login_required
def index(request):

    apList = Apiary.objects.filter(beek=request.user)
    print(f"Number of apiaries is {len(apList)}")
    context = {"apList": apList, "apiaryactive": "Y"}
    return render(request, "beedb/index.html", context)
    # return HttpResponse("Hello, world. You're at the beedb index.")


@login_required
def apDetail(request, ap_ref):

    ap = get_object_or_404(Apiary, pk=ap_ref)
    if ap.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    context = {"ap": ap}
    deadCol = []
    for c in ap.colony_set.all():
        if c.status == "D" or c.status == "A":
            if c.status_dt > (timezone.now() - datetime.timedelta(weeks=104)):
                deadCol.append(c)
    context["deadCol"] = deadCol
    return render(request, "beedb/apDetail.html", context)


@login_required
def apAdd(request):

    if request.method == "POST":
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
def colAdd(request, ap_ref, col_add_type):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if request.method == "POST":
        # print("Post message received")
        if col_add_type == 1:
            nf = SwarmForm(request.POST)
            if nf.is_valid():
                col = Colony(
                    apiary=ap,
                    colonyID=nf.cleaned_data["colonyName"],
                    descr=nf.cleaned_data["descr"],
                    status="C",
                )

                col.save()
                tr = Transfer(colony=col, transaction=3)
                tr.size = nf.cleaned_data["size"]
                tr.location = nf.cleaned_data["location"]
                tr.dt = nf.cleaned_data["dt"]
                tr.notes = nf.cleaned_data["notes"]
                tr.save()
                audit = Audit(
                    dt=timezone.now(),
                    transaction_cd=3,
                    beek=request.user,
                    colony=col,
                    apiary=col.apiary,
                )
                audit.detail = f"Swarm caught at {tr.location}"
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
        elif col_add_type == 2:
            nf = PurchaseForm(request.POST)
            if nf.is_valid():
                col = Colony(
                    apiary=ap,
                    colonyID=nf.cleaned_data["colonyName"],
                    descr=nf.cleaned_data["descr"],
                    status="C",
                )
                col.save()
                tr = Transfer(colony=col, transaction=2)
                tr.size = nf.cleaned_data["size"]
                tr.beek_name = nf.cleaned_data["beekName"]
                tr.beek_registration = nf.cleaned_data["beekReg"]
                tr.beek_email = nf.cleaned_data["beekEmail"]
                tr.beek_phone = nf.cleaned_data["beekPhone"]
                tr.beek_address = nf.cleaned_data["beekAddress"]
                tr.cost = nf.cleaned_data["cost"]
                tr.dt = nf.cleaned_data["dt"]
                tr.notes = nf.cleaned_data["notes"]
                tr.save()
                audit = Audit(
                    dt=timezone.now(),
                    transaction_cd=4,
                    beek=request.user,
                    colony=col,
                    apiary=col.apiary,
                )
                audit.detail = f"Colony purchased from {tr.beek_name}"
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
        elif col_add_type == 3:
            nf = ColonyAddForm(request.POST)
            if nf.is_valid():
                col = Colony(
                    apiary=ap,
                    colonyID=nf.cleaned_data["colonyName"],
                    descr=nf.cleaned_data["descr"],
                    status="C",
                )
                col.save()
                tr = Transfer(colony=col, transaction=4)
                tr.size = nf.cleaned_data["size"]
                tr.dt = timezone.now()
                tr.notes = nf.cleaned_data["notes"]
                tr.save()
                audit = Audit(
                    dt=timezone.now(),
                    transaction_cd=4,
                    beek=request.user,
                    colony=col,
                    apiary=col.apiary,
                )
                audit.detail = "New colony entered "
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
        else:
            nf = ColonyAddForm(request.POST)
            if nf.is_valid():
                col = Colony(
                    colonyID=nf.cleaned_data["colonyID"], descr=nf.cleaned_data["descr"]
                )
                col.apiary = ap
                col.status = "C"
                col.save()

                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))
        # if a GET (or any other method) we'll create a blank form
    else:
        if col_add_type == 1:
            nf = SwarmForm()
        elif col_add_type == 2:
            nf = PurchaseForm()
        else:
            nf = ColonyAddForm() 

    context = {"form": nf, "ap": ap, "col_add_type": col_add_type}
    return render(request, "beedb/colAdd.html", context)


@login_required
def colDetail(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    diary = col.diary_set.filter(completed=False)
    context = {"col": col, "diary": diary}
    return render(request, "beedb/colDetail.html", context)


@login_required
def colMod(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = ColonyModelForm(request.POST, instance=col)
        if nf.is_valid():
            col.lastAction = timezone.now()
            col.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = ColonyModelForm(instance=col)

    context = {"form": nf, "col": col}
    return render(request, "beedb/colMod.html", context)


@login_required
def colMoveChoose(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    apList = Apiary.objects.filter(beek=request.user).exclude(
        apiaryID=col.apiary.apiaryID
    )

    context = {"col": col, "apList": apList}
    return render(request, "beedb/colMoveChoose.html", context)


@login_required
def colMoveSelect(request, col_ref, ap_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    ap = get_object_or_404(Apiary, pk=ap_ref)

    if request.method == "POST":
        col.apiary = ap
        col.lastAction = timezone.now()
        col.save()
        return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))

    context = {"col": col, "ap": ap}
    return render(request, "beedb/colMoveSelect.html", context)


@login_required
def colDead(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = ColonyDeadForm(request.POST, instance=col)
        if nf.is_valid():
            col.status_dt = timezone.now()
            col.lastAction = timezone.now()
            col.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = ColonyDeadForm(instance=col)

    context = {"form": nf, "col": col}
    return render(request, "beedb/colDead.html", context)

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

            return HttpResponseRedirect(
                reverse("beedb:colDetail", args=[ins.colony.id])
            )
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


@login_required
def colTransfer(request, col_ref):

    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = TransferForm(request.POST)
        if nf.is_valid():
            transRec = nf.save(commit=False)
            transRec.colony = col
            transRec.transaction = 1
            transRec.save()
            col.status = "S"
            col.save()
            audit = Audit(
                dt=timezone.now(), transaction_cd=1, beek=request.user, colony=col
            )
            audit.detail = f"Colony sold to {transRec.beek_name} "
            audit.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[col.apiary.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = TransferForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colTransfer.html", context)


@login_required
def colSplit(request, col_ref):

    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = ColonyAddForm(request.POST)
        if nf.is_valid():
            newCol = Colony(
                apiary=col.apiary,
                colonyID=nf.cleaned_data["colonyName"],
                descr=nf.cleaned_data["descr"],
                status="C",
            )
            newCol.status = "C"
            newCol.save()
            tr = Transfer(colony=newCol, transaction=5)
            tr.notes = nf.cleaned_data["notes"]
            tr.size = nf.cleaned_data["size"]
            tr.save()
            audit = Audit(
                dt=timezone.now(),
                transaction_cd=2,
                beek=request.user,
                colony=newCol,
                apiary=col.apiary,
            )
            audit.detail = f"Colony {newCol.colonyID} split from {col.colonyID} "
            audit.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[col.apiary.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = ColonyAddForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colSplit.html", context)


@login_required
def diaryDetail(request, diary_ref):
    diary = get_object_or_404(Diary, pk=diary_ref)
    context = {"diary": diary}
    return render(request, "beedb/diaryDetail.html", context)


@login_required
def diaryMod(request, diary_ref):
    diary = get_object_or_404(Diary, pk=diary_ref)

    if request.method == "POST":
        # print("Post message received")
        nf = DiaryModelForm(request.POST, instance=diary)
        if nf.is_valid():
            diary.save()

            return HttpResponseRedirect(reverse("beedb:diaryDetail", args=[diary.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = DiaryModelForm(instance=diary)

    context = {"form": nf, "diary": diary}
    return render(request, "beedb/diaryMod.html", context)


@login_required
def colDiaryAdd(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)

    if request.method == "POST":
        # print("Post message received")
        nf = DiaryForm(request.POST)
        if nf.is_valid():
            diary = Diary(
                apiary=col.apiary,
                colony=col,
                beek=request.user,
                startDt=nf.cleaned_data["startDt"],
                dueDt=nf.cleaned_data["dueDt"],
                subject=nf.cleaned_data["subject"],
                details=nf.cleaned_data["details"],
            )
            diary.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = DiaryForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colDiaryAdd.html", context)

def purchSales(request):
    aList = request.user.apiary_set.all()
    print(f"Number of apiaries is {len(aList)}")
    pList = []
    sList = []
    for a in aList:
        for c in a.colony_set.all():
            for t in c.transfer_set.filter(transaction__lte=2):
                if t.transaction == 1:
                    print(f"Sale")
                    sList.append(t)
                else:
                    print(f"Purchase")
                    pList.append(t)
    disp = False
    if pList or sList:
        disp = True
    context = {"pList": pList, "sList": sList, "disp": disp}
    return render(request, "beedb/purchSales.html", context)



def login(request):
    if request.user.is_authenticated:
        return redirect("beedb:index")

    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(username=username, password=password)

        if user is not None:
            # correct username and password login the user
            auth.login(request, user)
            return redirect("beedb:index")

        else:
            messages.error(request, "Error wrong username/password")

    return render(request, "accounts/login.html")


def logout(request):
    auth.logout(request)
    return render(request, "accounts/logout.html")


def signup(request):

    if request.user.is_authenticated:
        return redirect("beedb:index")

    if request.method == "POST":
        f = CustomUserCreationForm(request.POST)
        if f.is_valid():
            f.save(request)
            messages.success(request, "Account created successfully")
            return redirect("beedb:login")

    else:
        f = CustomUserCreationForm()

    return render(request, "accounts/signup.html", {"form": f})


def activate_account(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.add_message(request, messages.INFO, "Account activated. Please login.")
    else:
        messages.add_message(
            request,
            messages.INFO,
            "Link Expired. Contact admin to activate your account.",
        )

    return redirect("beedb:login")

