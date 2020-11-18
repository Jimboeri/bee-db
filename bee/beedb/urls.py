from django.urls import path
from django.conf.urls import url

from . import views

app_name = "beedb"
urlpatterns = [
    path("", views.index, name="index"),
    path("apiary/<int:ap_ref>/", views.apDetail, name="apDetail"),
    path("apiary/add/", views.apAdd, name="apAdd"),
]
