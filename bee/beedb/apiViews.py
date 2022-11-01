from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import Http404, HttpResponse, HttpResponseRedirect
from rest_framework.views import APIView
from django.urls import reverse
from django.utils import timezone
import logging

from .models import TreatmentType

from .serializers import (
    TreatmentTypeView,
    TreatmentTypeDetail,
)


@api_view(["GET"])
def treatmentType_list(request):
    """
    List all TreatmentTypes
    """
    if request.user.is_authenticated:
        if request.method == "GET":
            treatmentTypes = TreatmentType.objects.all()
            serializer = TreatmentTypeView(treatmentTypes, many=True)
            return Response(serializer.data)

    return HttpResponseRedirect(reverse("beedb:login"))


@api_view(["GET"])
def treatmentType_view(request, treatType_ref):
    """
    view a TreatmentType details
    """
    if request.user.is_authenticated:
        if request.method == "GET":
            treatmentType = TreatmentType.objects.filter(id=treatType_ref)
            serializer = TreatmentTypeDetail(treatmentType, many=True)
            if treatmentType:
                # It exists    
                return Response(serializer.data)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    return HttpResponseRedirect(reverse("beedb:login"))

@api_view(["GET"])
def treatmentType_byName(request):
    """
    view a TreatmentType details
    """
    if request.user.is_authenticated:
        if request.method == "GET":
            params = request.GET
            if "name" in params:
                treatmentType = TreatmentType.objects.filter(name=params["name"])
                serializer = TreatmentTypeDetail(treatmentType, many=True)
                return Response(serializer.data)
                #if treatmentType:
                    # It exists    
                #    return Response(serializer.data)
                #else:
                #    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    return HttpResponseRedirect(reverse("beedb:login"))
