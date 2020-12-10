from django import forms
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

class ColonyAddForm(forms.ModelForm):
    class Meta:
        model = Colony
        fields = [
            "colonyID",
            "descr",
        ]
        widgets = {
            "descr": forms.Textarea(attrs={"rows": 3}),
        }

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