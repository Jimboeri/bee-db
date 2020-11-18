from django import forms
from .models import Apiary

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
