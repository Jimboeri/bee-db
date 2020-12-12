from django import forms
from django.utils import timezone

from .models import Apiary, Colony, Inspection, Transfer


class ApiaryAddForm(forms.ModelForm):
    class Meta:
        model = Apiary
        fields = [
            "apiaryID",
            "descr",
        ]
        widgets = {
            "descr": forms.Textarea(attrs={"rows": 3}),
        }

class ColonyModelForm(forms.ModelForm):
    class Meta:
        model = Colony
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
        model = Inspection
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
        model = Transfer
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
    beekName = forms.CharField(max_length=100, label="Beekeepers name")
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
    cost = forms.DecimalField(label="Cost of hive", max_digits=8, decimal_places=2, initial=0)

