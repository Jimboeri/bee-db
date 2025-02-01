from django.shortcuts import render, get_object_or_404, redirect  # type: ignore
from django.http import HttpResponseRedirect  # type: ignore
from django.contrib.auth.decorators import login_required  # type: ignore
from django.contrib.auth.models import User  # type: ignore

# from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.tokens import default_token_generator  # type: ignore
from django.contrib import auth, messages  # type: ignore

# from django.views import generic
from django.urls import reverse  # type: ignore
from django.utils import timezone  # type: ignore
from django.utils.encoding import force_str  # type: ignore
from django.utils.http import urlsafe_base64_decode  # type: ignore
from django import forms  # type: ignore
# from django.conf import settings # type: ignore

from .models import (
    Apiary,
    Colony,
    Inspection,
    Transfer,
    Audit,
    Diary,
    Feedback,
    Treatment,
    TreatmentType,
    Picture,
)

from .forms import (
    # ApiaryAddForm,
    # ColonyAddForm,
    # ColonyDeadForm,
    # InspectionForm,
    # InspectionOptionsForm,
    # TransferForm,
    # SwarmForm,
    # PurchaseForm,
    # ColonyModelForm,
    DiaryModelForm,
    DiaryForm,
    CustomUserCreationForm,
    TreatInInspectForm,
    UserFeedbackModelForm,
    AdminFeedbackModelForm,
    NewTreatmentForm,
    ModTreatmentForm,
    RemoveTreatmentForm,
    # ColonyReportForm,
)

from . import forms  # noqa: F811

from .utils import usrCheck

import datetime
import logging
import os
from geopy.distance import distance  # type: ignore

# from PIL import Image # type: ignore

eWeb_Base_URL = os.getenv("BEEDB_WEB_BASE_URL", "http://beedb.west.net.nz")

# Create your views here.


@login_required
def index(request):
    usrInfo = usrCheck(request)

    apList = Apiary.objects.filter(beek=usrInfo["procBeek"])
    logging.info(f"Number of apiaries is {len(apList)}")
    mapCoord = {
        "minLat": 0,
        "maxLat": 0,
        "centreLat": 0,
        "minLong": 0,
        "maxLong": 0,
        "centreLong": 0,
    }
    for a in apList:
        if a.latitude and a.longitude:
            if mapCoord["minLat"] == 0:
                mapCoord["minLat"] = a.latitude
                mapCoord["maxLat"] = a.latitude
            if mapCoord["minLong"] == 0:
                mapCoord["minLong"] = a.longitude
                mapCoord["maxLong"] = a.longitude
            if a.latitude < mapCoord["minLat"]:
                mapCoord["minLat"] = a.latitude
            if a.latitude > mapCoord["maxLat"]:
                mapCoord["maxLat"] = a.latitude
            if a.longitude < mapCoord["minLong"]:
                mapCoord["minLong"] = a.longitude
            if a.longitude > mapCoord["maxLong"]:
                mapCoord["maxLong"] = a.longitude
    mapCoord["centreLat"] = (mapCoord["minLat"] + mapCoord["maxLat"]) / 2  # type: ignore
    mapCoord["centreLong"] = (mapCoord["minLong"] + mapCoord["maxLong"]) / 2  # type: ignore
    mapCoord["maxDist"] = distance(
        (mapCoord["minLat"], mapCoord["minLong"]),
        (mapCoord["maxLat"], mapCoord["maxLong"]),
    ).m
    if mapCoord["maxDist"] < 1000:
        mapCoord["zoom"] = 16
    elif mapCoord["maxDist"] < 3500:
        mapCoord["zoom"] = 15
    elif mapCoord["maxDist"] < 5000:
        mapCoord["zoom"] = 14
    elif mapCoord["maxDist"] < 8000:
        mapCoord["zoom"] = 13
    elif mapCoord["maxDist"] < 20000:
        mapCoord["zoom"] = 12
    elif mapCoord["maxDist"] < 100000:
        mapCoord["zoom"] = 11
    else:
        mapCoord["zoom"] = 10
    context = {"apList": apList, "apiaryactive": "Y", "mapCoord": mapCoord}
    context["usrInfo"] = usrInfo

    return render(request, "beedb/index.html", context)


@login_required
def apDetail(request, ap_ref):
    usrInfo = usrCheck(request)
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if ap.beek != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")

    context = {"ap": ap}
    deadCol = []
    liveCol = []
    for c in ap.colony_set.all().order_by("-status_dt"):  # type: ignore
        if c.status == "D" or c.status == "A":
            if c.status_dt > (timezone.now() - datetime.timedelta(weeks=104)):
                deadCol.append(c)
        if c.status == "C":
            badges = []
            if c.diary_set.filter(completed=False).filter(dueDt__lte=timezone.now()):
                badges.append("Overdue reminder")
            if c.treatment_set.filter(completed=False).filter(
                removeDt__lte=timezone.now()
            ):
                badges.append("Treatment needs removal")

            cCol = {"colony": c, "badges": badges}
            liveCol.append(cCol)
    context["deadCol"] = deadCol  # type: ignore
    context["liveCol"] = liveCol  # type: ignore
    context["usrInfo"] = usrInfo  # type: ignore
    return render(request, "beedb/apDetail.html", context)


@login_required
def apAdd(request):
    usrInfo = usrCheck(request)
    if request.user != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")

    if request.method == "POST":
        nf = forms.ApiaryAddForm(request.POST)
        if nf.is_valid():
            print("Valid BK 1")
            ap = Apiary(
                apiaryID=nf.cleaned_data["apiaryID"], descr=nf.cleaned_data["descr"]
            )
            ap.beek = request.user
            ap.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.ApiaryAddForm()

    context = {"form": nf}
    return render(request, "beedb/apAdd.html", context)


@login_required
def apMod(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if ap.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        # print("Post message received")
        nf = forms.ApiaryAddForm(request.POST, instance=ap)
        if nf.is_valid():
            ap.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.ApiaryAddForm(instance=ap)

    context = {"form": nf, "ap": ap}
    return render(request, "beedb/apMod.html", context)


@login_required
def apPhotoAdd(request, ap_ref):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if ap.beek != request.user:
        return render(request, "beedb/not_authorised.html")

    if request.method == "POST":
        # print("Post message received")
        pf = forms.PhotoForm2(request.POST, request.FILES)

        if pf.is_valid():
            title = pf.cleaned_data.get("title")
            img = pf.cleaned_data.get("img")
            obj = Picture.objects.create(title=title)
            obj.beek = ap.beek
            obj.apiary = ap
            obj.img = img  # type: ignore
            obj.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        # if a GET (or any other method) we'll create a blank form
    else:
        pf = forms.PhotoForm2()

    context = {"form": pf, "apiary": ap}
    return render(request, "beedb/apPhotoAdd.html", context)


@login_required
def colAdd(request, ap_ref, col_add_type):
    ap = get_object_or_404(Apiary, pk=ap_ref)
    if ap.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        # print("Post message received")
        if col_add_type == 1:  # SWARM
            nf = forms.SwarmForm(request.POST)
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
                audit.transfer = tr
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        elif col_add_type == 2:  # Purchase
            nf = forms.PurchaseForm(request.POST)
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
                audit.transfer = tr
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        elif col_add_type == 3:
            nf = forms.ColonyAddForm(request.POST)
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
                    transaction_cd=5,
                    beek=request.user,
                    colony=col,
                    apiary=col.apiary,
                )
                audit.detail = "New colony entered "
                audit.transfer = tr
                audit.save()
                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        else:
            nf = forms.ColonyAddForm(request.POST)
            if nf.is_valid():
                col = Colony(
                    colonyID=nf.cleaned_data["colonyID"], descr=nf.cleaned_data["descr"]
                )
                col.apiary = ap
                col.status = "C"
                col.save()

                return HttpResponseRedirect(reverse("beedb:apDetail", args=[ap.id]))  # type: ignore
        # if a GET (or any other method) we'll create a blank form
    else:
        if col_add_type == 1:
            nf = forms.SwarmForm()
        elif col_add_type == 2:
            nf = forms.PurchaseForm()
        else:
            nf = forms.ColonyAddForm()

    context = {"form": nf, "ap": ap, "col_add_type": col_add_type}
    return render(request, "beedb/colAdd.html", context)


@login_required
def colDetail(request, col_ref):
    usrInfo = usrCheck(request)
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")
    lst_inspect = {}
    if col.inspection_set.all():  # type: ignore
        lst_inspect = col.inspection_set.all()[0]  # type: ignore
    diary = col.diary_set.filter(completed=False).order_by("dueDt")  # type: ignore
    treatments = col.treatment_set.filter(completed=False).order_by("removeDt")  # type: ignore
    yearAgo = timezone.now() - datetime.timedelta(weeks=52)
    pastTreatments = col.treatment_set.filter(insertDt__gte=yearAgo).order_by(
        "-insertDt"
    )  # type: ignore
    pastInspections = col.inspection_set.filter(dt__gte=yearAgo).order_by("-dt")  # type: ignore
    context = {
        "col": col,
        "diary": diary,
        "lst_inspect": lst_inspect,
        "treatments": treatments,
    }
    context["usrInfo"] = usrInfo
    context["today"] = timezone.now()
    context["pastTreatments"] = pastTreatments
    context["pastInspections"] = pastInspections

    return render(request, "beedb/colDetail.html", context)


@login_required
def colMod(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        # print("Post message received")
        nf = forms.ColonyModelForm(request.POST, instance=col)
        if nf.is_valid():
            col.lastAction = timezone.now()
            col.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.ColonyModelForm(instance=col)

    context = {"form": nf, "col": col}
    return render(request, "beedb/colMod.html", context)


@login_required
def colPhotoAdd(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")

    if request.method == "POST":
        # print("Post message received")
        pf = forms.PhotoForm2(request.POST, request.FILES)

        if pf.is_valid():
            title = pf.cleaned_data.get("title")
            img = pf.cleaned_data.get("img")
            obj = Picture.objects.create(title=title)
            obj.beek = col.apiary.beek
            obj.apiary = col.apiary
            obj.colony = col
            obj.img = img  # type: ignore
            obj.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
        # if a GET (or any other method) we'll create a blank form
    else:
        pf = forms.PhotoForm2()

    context = {"form": pf, "colony": col}
    return render(request, "beedb/colPhotoAdd.html", context)


# =======
# =======
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
        audit = Audit(beek=request.user, transaction_cd=7)
        audit.colony = col
        audit.apiary = ap
        audit.detail = (
            f"Colony {col.colonyID} moved FROM {col.apiary.apiaryID} TO {ap.apiaryID}"
        )
        audit.save()
        col.apiary = ap
        col.lastAction = timezone.now()
        col.save()

        return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore

    context = {"col": col, "ap": ap}
    return render(request, "beedb/colMoveSelect.html", context)


@login_required
def colDead(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = forms.ColonyDeadForm(request.POST, instance=col)
        if nf.is_valid():
            col.status_dt = timezone.now()
            col.lastAction = timezone.now()
            col.save()
            audit = Audit(
                dt=timezone.now(),
                transaction_cd=8,
                beek=request.user,
                colony=col,
            )
            if col.status == "D":
                audit.detail = f"Colony {col.colonyID} has died. Notes: {col.notes}"
            else:
                audit.detail = f"Colony {col.colonyID} appears to have absconded. Notes: {col.notes}"
            audit.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.ColonyDeadForm(instance=col)

    context = {"form": nf, "col": col}
    return render(request, "beedb/colDead.html", context)


@login_required
def colCombine(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    otherCol = Colony.objects.filter(apiary=col.apiary).filter(status__exact="C")
    otherCol = otherCol.exclude(colonyID__exact=col)
    context = {"col": col, "colonies": otherCol}
    return render(request, "beedb/colCombine.html", context)


@login_required
def colCombine1(request, col1_ref, col2_ref):
    col1 = get_object_or_404(Colony, pk=col1_ref)
    col2 = get_object_or_404(Colony, pk=col2_ref)
    context = {"col1": col1, "col2": col2}
    return render(request, "beedb/colCombine1.html", context)


@login_required
def colCombine2(request, col1_ref, col2_ref):
    col1 = get_object_or_404(Colony, pk=col1_ref)
    col2 = get_object_or_404(Colony, pk=col2_ref)
    audit = Audit(
        dt=timezone.now(),
        transaction_cd=6,
        beek=request.user,
        colony=col2,
        colony1=col1,
        apiary=col1.apiary,
    )
    audit.detail = f"Colony {col2.colonyID} has been combined with {col1.colonyID} "
    audit.save()
    col2.status = "M"
    col2.save()
    context = {"col": col1}
    return render(request, "beedb/colDetail.html", context)


@login_required
def inspectDetail(request, ins_ref):
    usrInfo = usrCheck(request)
    ins = get_object_or_404(Inspection, pk=ins_ref)
    if ins.colony.apiary.beek != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")
    context = {"ins": ins, "currUser": request.user}
    context["usrInfo"] = usrInfo
    return render(request, "beedb/inspectDetail.html", context)


@login_required
def inspectMod(request, ins_ref):
    ins = get_object_or_404(Inspection, pk=ins_ref)
    if ins.colony.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        # print("Post message received")
        nf = forms.InspectionForm(request.POST, instance=ins, inColony=ins.colony)
        if nf.is_valid():
            ins.save()

            return HttpResponseRedirect(reverse("beedb:inspectDetail", args=[ins.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.InspectionForm(instance=ins, inColony=ins.colony)

    context = {"form": nf, "ins": ins}
    return render(request, "beedb/inspectMod.html", context)


@login_required
def inspectAdd(request, col_ref):
    logging.debug("InspectAdd function")
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        logging.debug("Processing inspection")
        nf = forms.InspectionForm(request.POST, inColony=col)
        df = DiaryModelForm(request.POST)
        tf = TreatInInspectForm(request.POST)
        optForm = forms.InspectionOptionsForm(request.POST)

        optForm.is_valid()

        lDiary = True
        if optForm.cleaned_data["addReminder"]:
            if not df.is_valid():
                # should redisplay the form
                lDiary = False

        lTreatment = True
        if optForm.cleaned_data["addTreatment"]:
            if not tf.is_valid():
                # should redisplay the form
                lTreatment = False
            if tf.cleaned_data["treatmentType"] is None:
                lTreatment = False
            logging.debug(f"TreatmentType = {tf.cleaned_data['treatmentType']}")

        logging.debug(f"lDiary = {lDiary} and lTreatment = {lTreatment}")

        if nf.is_valid() and optForm.is_valid() and lDiary and lTreatment:
            logging.info(f"Inspection valid, cleaned data = {nf.cleaned_data}")
            ins = nf.save(commit=False)
            ins.colony = col
            ins.size = col.size
            ins.save()
            if optForm.cleaned_data["addReminder"]:
                if df.is_valid():
                    logging.info("diary is valid")
                    if df.cleaned_data["subject"]:
                        logging.info("Diary subject not blank")
                        diary = df.save(commit=False)
                        diary.beek = request.user
                        diary.colony = col
                        diary.save()
            if optForm.cleaned_data["addTreatment"]:
                logging.debug("Treatment starting")
                if tf.is_valid():
                    logging.debug("Treatment is valid, ")
                    cTreatmentType = tf.cleaned_data["treatmentType"]
                    tTypes = TreatmentType.objects.filter(name=cTreatmentType)
                    if tTypes:  # Definately found a tratement type
                        treatment = Treatment(treatmentType=tTypes[0], colony=col)
                        treatment.insertDt = ins.dt
                        treatment.preVarroa = ins.varroa
                        treatment.removeDt = tf.cleaned_data["removeDt"]
                        treatment.trNotes = tf.cleaned_data["trNotes"]
                        if not treatment.treatmentType.requireRemoval:
                            treatment.completed = True
                        treatment.save()

            return HttpResponseRedirect(
                reverse("beedb:colDetail", args=[ins.colony.id])  # type: ignore
            )
    # if a GET (or any other method) we'll create a blank form
    else:
        optForm = forms.InspectionOptionsForm()
        nf = forms.InspectionForm(inColony=col)
        # logging.info(sizeChoices(col.size, "Number"))
        df = DiaryModelForm()
        tf = TreatInInspectForm(request.POST)
    context = {
        "form": nf,
        "col": col,
        "diaryForm": df,
        "TreatForm": tf,
        "optForm": optForm,
    }
    return render(request, "beedb/inspectAdd.html", context)


@login_required
def inspectDel(request, ins_ref):
    ins = get_object_or_404(Inspection, pk=ins_ref)
    if ins.colony.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    col = ins.colony
    if request.method == "POST":
        ins.delete()
        return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
    else:
        context = {"ins": ins}
    return render(request, "beedb/inspectDelete.html", context)


@login_required
def colTransfer(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = forms.TransferForm(request.POST)
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

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[col.apiary.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.TransferForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colTransfer.html", context)


@login_required
def colSplit(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if request.method == "POST":
        # print("Post message received")
        nf = forms.ColonyAddForm(request.POST)
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
                colony1=col,
                apiary=col.apiary,
            )
            audit.detail = f"Colony {newCol.colonyID} split from {col.colonyID} "
            audit.transfer = tr
            audit.save()

            return HttpResponseRedirect(reverse("beedb:apDetail", args=[col.apiary.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = forms.ColonyAddForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colSplit.html", context)


# Diary / reminder views
@login_required
def diaryDetail(request, diary_ref):
    usrInfo = usrCheck(request)
    diary = get_object_or_404(Diary, pk=diary_ref)
    if diary.colony:
        if diary.colony.apiary.beek != usrInfo["procBeek"]:
            return render(request, "beedb/not_authorised.html")
    elif diary.apiary:
        if diary.apiary.beek != usrInfo["procBeek"]:
            return render(request, "beedb/not_authorised.html")
    context = {"diary": diary}
    context["usrInfo"] = usrInfo  # type: ignore
    return render(request, "beedb/diaryDetail.html", context)


@login_required
def diaryMod(request, diary_ref):
    diary = get_object_or_404(Diary, pk=diary_ref)

    if request.method == "POST":
        # print("Post message received")
        nf = DiaryModelForm(request.POST, instance=diary)
        if nf.is_valid():
            diary.save()

            return HttpResponseRedirect(reverse("beedb:diaryDetail", args=[diary.id]))  # type: ignore
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
                # startDt=nf.cleaned_data["startDt"],
                dueDt=nf.cleaned_data["dueDt"],
                subject=nf.cleaned_data["subject"],
                details=nf.cleaned_data["details"],
            )
            diary.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = DiaryForm()

    context = {"form": nf, "col": col}
    return render(request, "beedb/colDiaryAdd.html", context)


@login_required
def colDiaryComplete(request, diary_ref, col_ref):
    diary = get_object_or_404(Diary, pk=diary_ref)
    diary.completed = True
    diary.save()

    return HttpResponseRedirect(reverse("beedb:colDetail", args=[col_ref]))


# Varroa treatment views
@login_required
def treatmentAdd(request, col_ref):
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != request.user:
        return render(request, "beedb/not_authorised.html")
    if request.method == "POST":
        # print("Post message received")

        ntf = NewTreatmentForm(request.POST)
        # logging.debug(f"Form = {ntf}")
        # logging.debug(f"TreatmentType = {ntf.cleaned_data['treatmentType']}")
        if ntf.is_valid():
            treatment = ntf.save(commit=False)
            treatment.colony = col
            if not treatment.treatmentType.requireRemoval:
                treatment.completed = True
            treatment.save()

            return HttpResponseRedirect(reverse("beedb:colDetail", args=[col.id]))  # type: ignore
        else:
            logging.debug(f"Invalid treatment form {ntf.non_field_errors}")
    # if a GET (or any other method) we'll create a blank form
    else:
        ntf = NewTreatmentForm()

    context = {"form": ntf, "col": col}
    return render(request, "beedb/treatmentAdd.html", context)


@login_required
def treatDetail(request, treat_ref):
    usrInfo = usrCheck(request)
    treat = get_object_or_404(Treatment, pk=treat_ref)
    if treat.colony.apiary.beek != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")
    context = {"treat": treat}
    context["usrInfo"] = usrInfo  # type: ignore
    return render(request, "beedb/treatDetail.html", context)


@login_required
def treatMod(request, treat_ref):
    treat = get_object_or_404(Treatment, pk=treat_ref)

    if request.method == "POST":
        # print("Post message received")
        tf = ModTreatmentForm(request.POST, instance=treat)
        if tf.is_valid():
            tf.save()

            return HttpResponseRedirect(reverse("beedb:treatDetail", args=[treat.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        tf = ModTreatmentForm(instance=treat)

    context = {"form": tf, "treat": treat}
    return render(request, "beedb/treatMod.html", context)


@login_required
def treatComplete(request, treat_ref):
    treat = get_object_or_404(Treatment, pk=treat_ref)
    if request.method == "POST":
        # print("Post message received")
        tf = RemoveTreatmentForm(request.POST, instance=treat)
        if tf.is_valid():
            tf.save()

            return HttpResponseRedirect(reverse("beedb:treatDetail", args=[treat.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        treat.completed = True
        tf = RemoveTreatmentForm(instance=treat)

    context = {"form": tf, "treat": treat}
    return render(request, "beedb/treatRemove.html", context)


@login_required
def reports(request):
    """
    View that displays available reports.
    """
    context = {"reportactive": "Y"}
    return render(request, "beedb/reports.html", context)


@login_required
def purchSales(request):
    aList = request.user.apiary_set.all()
    # print(f"Number of apiaries is {len(aList)}")
    pList = []
    sList = []
    for a in aList:
        for c in a.colony_set.all():
            for t in c.transfer_set.filter(transaction__lte=2):
                if t.transaction == 1:
                    print("Sale")
                    sList.append(t)
                else:
                    print("Purchase")
                    pList.append(t)
    disp = False
    if pList or sList:
        disp = True
    context = {"pList": pList, "sList": sList, "disp": disp, "reportactive": "Y"}
    return render(request, "beedb/purchSales.html", context)


@login_required
def colReportChoose(request):
    """This function allows users to create a report by colony

    More data here in the future
    """
    usrInfo = usrCheck(request)
    apList = Apiary.objects.filter(beek=usrInfo["procBeek"])

    aps = []
    for ap in apList:
        cols = []
        currCols = ap.colony_set.filter(status="C")  # type: ignore
        otherCols = ap.colony_set.exclude(status="C").filter(
            lastAction__gte=(timezone.now() - datetime.timedelta(weeks=27))
        )  # type: ignore
        for cc in currCols:
            cols.append(cc)
        for oc in otherCols:
            cols.append(oc)
        aps.append({"apiary": ap, "colonies": cols})

    if request.method == "POST":
        # print("Post message received")
        rf = forms.ColonyReportForm(request.POST)
        if rf.is_valid():
            print(rf.cleaned_data)
            logging.debug(f"Form keys = {rf.cleaned_data}")

            return HttpResponseRedirect(
                reverse(
                    "beedb:colReport",
                    args=[rf.cleaned_data["colID"], rf.cleaned_data["duration"]],
                )
            )
    # if a GET (or any other method) we'll create a blank form
    else:
        rf = forms.ColonyReportForm()

    context = {"apList": aps, "reportactive": "Y", "usrInfo": usrInfo, "form": rf}
    return render(request, "beedb/colReportChoose.html", context)


@login_required
def colReport(request, col_ref, duration):
    """This function allows users to create a report by colony

    More data here in the future
    """

    def sortFunc(inp):
        """Used to sort the events array"""
        return inp["dt"]

    usrInfo = usrCheck(request)
    col = get_object_or_404(Colony, pk=col_ref)
    if col.apiary.beek != usrInfo["procBeek"]:
        return render(request, "beedb/not_authorised.html")

    if duration == 1:
        startDt = timezone.now() - datetime.timedelta(days=30)
    elif duration == 2:
        startDt = timezone.now() - datetime.timedelta(weeks=27)
    elif duration == 3:
        startDt = timezone.now() - datetime.timedelta(weeks=52)
    elif duration == 4:
        startDt = timezone.now() - datetime.timedelta(weeks=260)
    else:
        startDt = timezone.now() - datetime.timedelta(weeks=1000)

    pastTreatments = col.treatment_set.filter(insertDt__gte=startDt)  # type: ignore
    pastInspections = col.inspection_set.filter(dt__gte=startDt)  # type: ignore
    pastAudits = col.audit_set.filter(dt__gte=startDt)  # type: ignore
    otherAudits = Audit.objects.filter(colony1=col).filter(dt__gte=startDt)

    events = []
    for tr in pastTreatments:
        events.append({"type": "T", "dt": tr.insertDt, "obj": tr})
    for ins in pastInspections:
        events.append({"type": "I", "dt": ins.dt, "obj": ins})
    for aud in pastAudits:
        events.append({"type": "A", "dt": aud.dt, "obj": aud})
    for aud in otherAudits:
        events.append({"type": "A", "dt": aud.dt, "obj": aud})

    events.sort(reverse=True, key=sortFunc)

    context = {"col": col, "reportactive": "Y", "usrInfo": usrInfo, "events": events}
    return render(request, "beedb/colReport.html", context)


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
            messages.success(
                request, "Account created successfully, please check your email"
            )
            return redirect("beedb:login")

    else:
        f = CustomUserCreationForm()

    return render(request, "accounts/signup.html", {"form": f})


def activate_account(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
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


@login_required
def feedbackIndex(request):
    if request.user.is_staff:
        feedbackList = Feedback.objects.all()
    else:
        feedbackList = Feedback.objects.filter(beek=request.user)
    # print(f"Number of feedbacks is/are {len(feedbackList)}")
    context = {"fbList": feedbackList, "feedbackactive": "Y"}
    return render(request, "beedb/indexFeedback.html", context)


@login_required
def userFeedbackAdd(request):
    if request.method == "POST":
        # print("Post message received")
        nf = UserFeedbackModelForm(request.POST)
        if nf.is_valid():
            fb = Feedback(
                beek=request.user,
                subject=nf.cleaned_data["subject"],
                detail=nf.cleaned_data["detail"],
                feedbackType=nf.cleaned_data["feedbackType"],
            )
            fb.save()

            return HttpResponseRedirect(reverse("beedb:fbIndex"))
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = UserFeedbackModelForm()

    context = {"form": nf}
    return render(request, "beedb/userFeedbackAdd.html", context)


@login_required
def userFeedbackView(request, fb_ref):
    fb = get_object_or_404(Feedback, pk=fb_ref)
    context = {"fb": fb}
    return render(request, "beedb/userFeedbackView.html", context)


@login_required
def adminFeedbackMod(request, fb_ref):
    fb = get_object_or_404(Feedback, pk=fb_ref)

    if request.method == "POST":
        # print("Post message received")
        nf = AdminFeedbackModelForm(request.POST, instance=fb)
        if nf.is_valid():
            print(nf.changed_data)
            print("Feedback mod ")
            if "devComment" in nf.changed_data:
                fb.lstCommentDt = timezone.now()
            if "status" in nf.changed_data:
                fb.lstStatusDt = timezone.now()
            nf.save()
            fb.save()

            return HttpResponseRedirect(reverse("beedb:userfbView", args=[fb.id]))  # type: ignore
    # if a GET (or any other method) we'll create a blank form
    else:
        nf = AdminFeedbackModelForm(instance=fb)

    context = {"form": nf, "fb": fb}
    return render(request, "beedb/adminFeedbackMod.html", context)
