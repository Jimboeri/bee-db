from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required

# from django.contrib.auth.forms import UserCreationForm
# from django.contrib.auth.tokens import default_token_generator
# from django.contrib import auth, messages
# from django.views import generic
from django.urls import reverse
# from django.utils.encoding import force_bytes, force_text


from .forms import (
    ProfileForm,
    InspectPreferenceModelForm,
    CommsPreferenceModelForm,
)


# Create your views here.


@login_required
def profileDetail(request):
    print("Profile View profile.profileDetail")
    print(request.user.first_name)
    print(f"Beek ref {request.user.profile.bkRegistration}")

    context = {"profileactive": "Y", "beek": request.user}
    # context["jim"] = "Hello Jim"
    return render(request, "beedb/profile/profile.html", context)


@login_required
def profileMod(request):
    if request.method == "POST":
        # print("Post message received")
        nf = ProfileForm(request.POST)
        if nf.is_valid():
            request.user.first_name = nf.cleaned_data["firstName"]
            request.user.last_name = nf.cleaned_data["surName"]
            request.user.profile.phoneNumber = nf.cleaned_data["phoneNumber"]
            request.user.profile.bkRegistration = nf.cleaned_data["bkRegistration"]
            request.user.profile.address = nf.cleaned_data["address"]
            request.user.email = nf.cleaned_data["email"]
            request.user.save()
            request.user.profile.save()
            return HttpResponseRedirect(reverse("beedb:profileDetail"))
    else:
        nf = ProfileForm(
            initial={
                "firstName": request.user.first_name,
                "surName": request.user.last_name,
                "phoneNumber": request.user.profile.phoneNumber,
                "bkRegistration": request.user.profile.bkRegistration,
                "address": request.user.profile.address,
                "email": request.user.email,
            }
        )
    context = {"form": nf}
    return render(request, "beedb/profile/profileMod.html", context)


@login_required
def inspectPrefDetail(request):
    context = {"profileactive": "Y", "beek": request.user}
    return render(request, "beedb/profile/inspectPref.html", context)


@login_required
def inspectPrefMod(request):
    if request.method == "POST":
        # print("Post message received")
        nf = InspectPreferenceModelForm(request.POST, instance=request.user.profile)
        if nf.is_valid():
            request.user.profile.save()

            return HttpResponseRedirect(reverse("beedb:inspectPrefDetail"))
        # if a GET (or any other method) we'll create a blank form
    else:
        nf = InspectPreferenceModelForm(instance=request.user.profile)

    context = {"form": nf}
    return render(request, "beedb/profile/inspectPrefMod.html", context)


@login_required
def commsPrefDetail(request):
    context = {"profileactive": "Y", "beek": request.user}
    return render(request, "beedb/profile/commsPref.html", context)


@login_required
def commsPrefMod(request):
    if request.method == "POST":
        # print("Post message received")
        nf = CommsPreferenceModelForm(request.POST, instance=request.user.profile)
        if nf.is_valid():
            request.user.profile.save()

            return HttpResponseRedirect(reverse("beedb:commsPrefDetail"))
        # if a GET (or any other method) we'll create a blank form
    else:
        nf = CommsPreferenceModelForm(instance=request.user.profile)

    context = {"form": nf}
    return render(request, "beedb/profile/commsPrefMod.html", context)
