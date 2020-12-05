from django.urls import path
from django.conf.urls import url

from . import views

app_name = "beedb"
urlpatterns = [
    path("", views.index, name="index"),
    path("apiary/<int:ap_ref>/", views.apDetail, name="apDetail"),
    path("apiary/add/", views.apAdd, name="apAdd"),
    path("apiary/modify/<int:ap_ref>/", views.apMod, name="apMod"),
    path("colony/<int:col_ref>/", views.colDetail, name="colDetail"),
    path("colony/add/<int:ap_ref>/", views.colAdd, name="colAdd"),
    path("colony/modify/<int:col_ref>/", views.colMod, name="colMod"),
    path("colony/moveChoose/<int:col_ref>/", views.colMoveChoose, name="colMoveChoose"),
    path("colony/moveSelect/<int:col_ref>/<int:ap_ref>/", views.colMoveSelect, name="colMoveSelect"),
    path("inspection/<int:ins_ref>/", views.inspectDetail, name="inspectDetail"),
    path("inspection/modify/<int:ins_ref>/", views.inspectMod, name="inspectMod"),
    path("inspection/add/<int:col_ref>/", views.inspectAdd, name="inspectAdd"),
    path("inspection/del/<int:ins_ref>/", views.inspectDel, name="inspectDel"),
]
