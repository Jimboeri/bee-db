from django import forms
from .models import Apiary, Colony, Inspection

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
            "notes": forms.Textarea(attrs={"rows": 3}),
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
            "descr": forms.Textarea(attrs={"rows": 3}),
        }
