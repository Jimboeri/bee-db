from django import forms
from django.utils import timezone
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.conf import settings
from django.template.loader import render_to_string
from django.core.mail import send_mail

# from .models import Apiary, Colony, Inspection, Transfer, Diary
from . import models


class ApiaryAddForm(forms.ModelForm):
    class Meta:
        model = models.Apiary
        fields = [
            "apiaryID",
            "descr",
            "ownerResident",
            "residentPhone",
            "address",
            "latitude",
            "longitude",
            "location",
            "hazards",
        ]
        widgets = {
            "descr": forms.Textarea(attrs={"rows": 3}),
            "address": forms.Textarea(attrs={"rows": 3}),
            "location": forms.Textarea(attrs={"rows": 3}),
            "hazards": forms.Textarea(attrs={"rows": 3}),
        }


class ColonyModelForm(forms.ModelForm):
    class Meta:
        model = models.Colony
        fields = [
            "colonyID",
            "descr",
        ]
        widgets = {
            "descr": forms.Textarea(attrs={"rows": 3}),
        }


class ColonyAddForm(forms.Form):
    colonyName = forms.CharField(max_length=50, label="Colony name:")
    descr = forms.CharField(widget=forms.Textarea, label="Description", required=False)
    descr.widget.attrs.update(rows=3)
    size = forms.IntegerField(
        initial=1,
        min_value=1,
        max_value=4,
        help_text="1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)",
    )
    notes = forms.CharField(widget=forms.Textarea, required=False)
    notes.widget.attrs.update(rows=3)


class InspectionForm(forms.ModelForm):
    class Meta:
        model = models.Inspection
        fields = [
            "dt",
            "numbers",
            "eggs",
            "varroa",
            "weight",
            "disease",
            "temper",
            "queen_seen",
            "notes",
        ]
        widgets = {
            "notes": forms.Textarea(attrs={"rows": 3}),
            "dt": forms.DateInput,
        }


class TransferForm(forms.ModelForm):
    class Meta:
        model = models.Transfer
        fields = [
            "dt",
            "beek_name",
            "beek_registration",
            "beek_email",
            "beek_phone",
            "beek_address",
            "notes",
            "cost",
        ]
        widgets = {
            "notes": forms.Textarea(attrs={"rows": 3}),
            "beek_address": forms.Textarea(attrs={"rows": 3}),
            "dt": forms.DateInput,
        }


class SwarmForm(forms.Form):
    colonyName = forms.CharField(max_length=50, label="Colony name:")
    descr = forms.CharField(widget=forms.Textarea, required=False)
    descr.widget.attrs.update(rows=3)
    location = forms.CharField(max_length=200)
    dt = forms.DateField(initial=timezone.now)
    size = forms.IntegerField(
        initial=1,
        min_value=1,
        max_value=4,
        help_text="1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)",
    )
    notes = forms.CharField(widget=forms.Textarea, required=False)
    notes.widget.attrs.update(rows=3)


class PurchaseForm(forms.Form):
    colonyName = forms.CharField(max_length=50, label="Colony name:")
    descr = forms.CharField(widget=forms.Textarea, label="Description", required=False)
    descr.widget.attrs.update(rows=3)
    beekName = forms.CharField(max_length=100, label="Selling beekeepers name")
    beekReg = forms.CharField(max_length=100, label="Beekeepers registration")
    beekEmail = forms.EmailField(max_length=100, label="Beekeepers email")
    beekPhone = forms.CharField(max_length=100, label="Beekeepers phone number")
    beekAddress = forms.CharField(widget=forms.Textarea, label="Beekeepers address")
    beekAddress.widget.attrs.update(rows=3)
    dt = forms.DateField(initial=timezone.now)
    size = forms.IntegerField(
        initial=1,
        min_value=1,
        max_value=4,
        help_text="1 - Small (0 - 3 frames), 2 - Medium (4 - 8 frames), 3 - Regular(9 - 20 frames), 4 Large (>20 frames)",
    )
    notes = forms.CharField(widget=forms.Textarea, required=False)
    notes.widget.attrs.update(rows=3)
    cost = forms.DecimalField(
        label="Cost of hive", max_digits=8, decimal_places=2, initial=0
    )


class DiaryModelForm(forms.ModelForm):
    class Meta:
        model = models.Diary
        fields = ["subject", "details", "startDt", "dueDt", "completed"]
        widgets = {
            "details": forms.Textarea(attrs={"rows": 3}),
        }


class DiaryForm(forms.Form):
    subject = forms.CharField(max_length=100, label="Subject")
    details = forms.CharField(
        widget=forms.Textarea, label="Description", required=False
    )
    details.widget.attrs.update(rows=3)
    startDt = forms.DateField(initial=timezone.now, label="Start:")
    dueDt = forms.DateField(label="Due:")


class CustomUserCreationForm(forms.Form):
    #username = forms.CharField(label="Enter Username", min_length=4, max_length=150)
    email = forms.EmailField(label="Enter email")
    password1 = forms.CharField(label="Enter password", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Confirm password", widget=forms.PasswordInput)

    #def clean_username(self):
    #    username = self.cleaned_data["username"].lower()
    #    r = User.objects.filter(username=username)
    #    if r.count():
    #        raise ValidationError("Username already exists")
    #    return username

    def clean_email(self):
        email = self.cleaned_data["email"].lower()
        r = User.objects.filter(username=email)
        if r.count():
            raise ValidationError("Email already exists")
        return email

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")

        if password1 and password2 and password1 != password2:
            raise ValidationError("Password don't match")

        return password2

    def save(self, request):
        user = User.objects.create_user(
            #self.cleaned_data["username"],
            self.cleaned_data["email"],
            self.cleaned_data["email"],
            self.cleaned_data["password1"],
        )
        user.is_active = False
        user.save()

        context = {
            # 'from_email': settings.DEFAULT_FROM_EMAIL,
            'request': request,
            'protocol': request.scheme,
            'username': self.cleaned_data.get('email'),
            'domain': request.META['HTTP_HOST'],
            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            'token': default_token_generator.make_token(user),
        }

        subject = render_to_string('accounts/email/activation_subject.txt', context)
        email = render_to_string('accounts/email/activation_email.txt', context)

        send_mail(subject, email, settings.DEFAULT_FROM_EMAIL, [user.email])

        return user
