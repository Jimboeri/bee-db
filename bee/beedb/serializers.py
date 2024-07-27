from rest_framework import serializers
from .models import TreatmentType


class TreatmentTypeView(serializers.ModelSerializer):
    class Meta:
        model = TreatmentType
        fields = ["id", "name", "organic", "description"]


class TreatmentTypeDetail(serializers.ModelSerializer):
    class Meta:
        model = TreatmentType
        fields = [
            "id",
            "name",
            "manufacturer",
            "organic",
            "requireRemoval",
            "daysInHive",
            "url",
            "description",
            "instructions",
        ]
