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
from django.contrib.admin.widgets import AdminDateWidget, AdminSplitDateTime

from .utils import sizeChoices
from .widgets import FengyuanChenDatePickerInput

from . import models
import os
import datetime
import logging

# define some re-used choice options
VARROA_CHOICES = [
    (0, "Not recorded"),
    (1, "No varroa seen"),
    (2, "1 - 2 varroa / 300 bees"),
    (3, "3 - 6 varroa / 300 bees"),
    (4, "7 - 15 varroa / 300 bees"),
    (5, "More than 15 varroa / 300 bees"),
]


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
            "size",
        ]
        widgets = {
            "descr": forms.Textarea(attrs={"rows": 3}),
        }


class ColonyDeadForm(forms.ModelForm):

    class Meta:
        FORM_CHOICES = [
            ("D", "Dead"),
            ("A", "Absconded"),
        ]
        model = models.Colony
        fields = [
            "status",
            "notes",
        ]
        widgets = {
            "status": forms.Select(attrs={"choices": FORM_CHOICES}),
        }


class ColonyAddForm(forms.Form):
    colonyName = forms.CharField(max_length=50, label="Colony name:")
    descr = forms.CharField(widget=forms.Textarea,
                            label="Description", required=False)
    descr.widget.attrs.update(rows=3)
    size = forms.IntegerField(
        initial=3,
        min_value=1,
        max_value=5,
        help_text="Colony size",
    )
    notes = forms.CharField(widget=forms.Textarea, required=False)
    notes.widget.attrs.update(rows=3)

class InspectionOptionsForm(forms.Form):
    addReminder = forms.BooleanField(initial=False, required=False)
    addTreatment = forms.BooleanField(initial=False, required=False)

    # The js function is in basic.js. The id's are specified in the template. inspacetAdd.html
    addReminder.widget.attrs.update(onchange="classVisibility('id_addReminder', 'reminder')")
    addTreatment.widget.attrs.update(onchange="classVisibility('id_addTreatment', 'treatment')")
    

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
            "notes"
        ]
        widgets = {
            "notes": forms.Textarea(attrs={"rows": 3}),
            "dt": FengyuanChenDatePickerInput(attrs={'onchange': "TreatRemoveDt('id_dt')"}),
        }

    def __init__(self, *args, inColony, **kwargs):
        try:
            self.colony = inColony
            super(InspectionForm, self).__init__(*args, **kwargs)
            logging.info(f"colony is {self.colony.colonyID}")
            #self.fields['numbers'].choices=sizeChoices(self.colony.size, "Number")
            self.fields['numbers'] = forms.ChoiceField(choices=sizeChoices(
                self.colony.size, "Number"), help_text="How many bees in the hive (seams of bees)?",)
            self.fields['weight'] = forms.ChoiceField(choices=sizeChoices(
                self.colony.size, "Weight"), help_text="How heavy is the hive?",)

        except Exception as e:
            logging.debug(f"Initialisation error is {e}")


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
    descr = forms.CharField(widget=forms.Textarea,
                            label="Description", required=False)
    descr.widget.attrs.update(rows=3)
    beekName = forms.CharField(max_length=100, label="Selling beekeepers name")
    beekReg = forms.CharField(max_length=100, label="Beekeepers registration")
    beekEmail = forms.EmailField(max_length=100, label="Beekeepers email")
    beekPhone = forms.CharField(
        max_length=100, label="Beekeepers phone number")
    beekAddress = forms.CharField(
        widget=forms.Textarea, label="Beekeepers address")
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
        fields = ["subject", "details", "dueDt", "completed"]
        widgets = {
            "details": forms.Textarea(attrs={"rows": 3}),
            "dueDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d']}),

        }


class DiaryForm(forms.Form):
    subject = forms.CharField(max_length=100, label="Subject", required=False)
    details = forms.CharField(
        widget=forms.Textarea, label="Description", required=False
    )
    details.widget.attrs.update(rows=3)
    dueDt = forms.DateField(initial=timezone.now() +
                            datetime.timedelta(weeks=1), label="Due:")

    widgets = {
        "dueDt": AdminDateWidget,
    }

    def clean(self):
        cleaned_data = super().clean()
        subject = cleaned_data.get("subject")
        details = cleaned_data.get("details")

        if details and not subject:
            self.add_error(
                'subject', 'Need to have a subject for the reminder')


class CustomUserCreationForm(forms.Form):

    #username = forms.CharField(label="Enter Username", min_length=4, max_length=150)
    email = forms.EmailField(label="Enter email")
    password1 = forms.CharField(
        label="Enter password", widget=forms.PasswordInput)
    password2 = forms.CharField(
        label="Confirm password", widget=forms.PasswordInput)

    # def clean_username(self):
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
        eWeb_Base_URL = os.getenv(
            "BEEDB_WEB_BASE_URL", "http://beedb.west.net.nz")
        user = User.objects.create_user(
            # self.cleaned_data["username"],
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
            'email': user.email,
            'base_url': eWeb_Base_URL,
        }

        subject = render_to_string(
            'accounts/email/activation_subject.txt', context)
        email = render_to_string(
            'accounts/email/activation_email.txt', context)
        html_msg = render_to_string(
            'accounts/email/activation_email.html', context)

        msg = models.Message(beek=user, subject=subject,
                             body=email, html=html_msg)
        msg.save()

        #send_mail(subject, email, settings.DEFAULT_FROM_EMAIL, [user.email])

        return user


class ProfileForm(forms.Form):
    firstName = forms.CharField(max_length=50, label="First name:")
    surName = forms.CharField(max_length=100, label="Surname:")
    phoneNumber = forms.CharField(max_length=50, label="Mobile phone number:")
    bkRegistration = forms.CharField(
        max_length=10, label="Registration number:")
    address = forms.CharField(widget=forms.Textarea(attrs={"rows": 4}),
                              label="Physical address:")
    email = forms.EmailField(label="Email address")


class InspectPreferenceModelForm(forms.ModelForm):
    class Meta:
        model = models.Profile
        fields = ["inspectPeriodSummer",
                  "inspectPeriodAutumn",
                  "inspectPeriodWinter",
                  "inspectPeriodSpring",
                  # "inspectHealthIndex",
                  # "inspectManualIndex",
                  # "inspectDiaryAdd",
                  ]


class CommsPreferenceModelForm(forms.ModelForm):
    class Meta:
        model = models.Profile
        fields = ["commsWeeklySummary",
                  # "commsInspectionReminder",
                  ]


class UserFeedbackModelForm(forms.ModelForm):
    class Meta:
        model = models.Feedback
        fields = ["feedbackType",
                  "subject",
                  "detail",
                  ]


class AdminFeedbackModelForm(forms.ModelForm):
    class Meta:
        model = models.Feedback
        fields = ["status",
                  "devComment",
                  ]


class TreatInInspectForm(forms.Form):
    """
    This form is only used in the views.inspectAdd function
    I could not use a model form as the treatmentType is required in the model. However this stops the
    form being submitted even if the user does not want to add a treatment
    """
    treatmentType = forms.ModelChoiceField(models.TreatmentType.objects.all(), required=False)
    # this adds an 'onchange' attribute to the field. Every time the field changes
    # the form is submitted. This allows the remove Dt to be initialised
    # treatmentType.widget.attrs.update(onchange="this.form.submit()")
    treatmentType.widget.attrs.update(onchange="TreatRemoveDt('id_dt')")

    removeDt = forms.DateField(label="Take treatment out:",
                               input_formats=['%Y-%m-%d'],
                               widget=FengyuanChenDatePickerInput(),
                               required=False)
    trNotes = forms.CharField(
        widget=forms.Textarea, label="Notes", required=False
    )
    trNotes.widget.attrs.update(rows=3)

class NewTreatmentForm(forms.ModelForm):
    class Meta:
        model = models.Treatment
        fields = ["treatmentType",
                  "insertDt",
                  "removeDt",
                  "preVarroa",
                  "trNotes",
                  "completed"]
        widgets = {
            # this adds an 'onchange' attribute to the field. Every time the field changes
            # the form is submitted. This allows the remove Dt to be initialised
            # treatmentType.widget.attrs.update(onchange="this.form.submit()")
            "treatmentType": forms.Select(attrs={'onchange': "TreatRemoveDt('id_insertDt')"}),
            # Insert dt also uses the javascript function
            "insertDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d'], 'onchange': "TreatRemoveDt('id_insertDt')"}),
            "removeDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d']}),
            "trNotes": forms.Textarea(attrs={'rows': 3})
        }


class ModTreatmentForm(forms.ModelForm):
    class Meta:
        model = models.Treatment
        fields = ["treatmentType",
                  "insertDt",
                  "removeDt",
                  "preVarroa",
                  "postVarroa",
                  "trNotes",
                  "completed"]
        widgets = { 
            # this adds an 'onchange' attribute to the field. Every time the field changes
            # the form is submitted. This allows the remove Dt to be initialised
            "treatmentType": forms.Select(attrs={'onchange': "TreatRemoveDt('id_insertDt')"}),
            "insertDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d'], 'onchange': "TreatRemoveDt('id_insertDt')"}),
            "removeDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d']}),         
            "trNotes": forms.Textarea(attrs={'rows': 3})
        }


class RemoveTreatmentForm(forms.ModelForm):
    class Meta:
        model = models.Treatment
        fields = ["removeDt",
                  "postVarroa",
                  "trNotes",
                  "completed"]
        widgets = {
            "removeDt": FengyuanChenDatePickerInput(attrs={'input_formats': ['%Y-%m-%d']}),
            "trNotes": forms.Textarea(attrs={'rows': 3})
        }
