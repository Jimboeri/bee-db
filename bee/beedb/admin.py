from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from . import models

class ProfileInline(admin.StackedInline):
    model = models.Profile

class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, )

admin.site.unregister(User) # unregister User model
admin.site.register(User, CustomUserAdmin) # register User model with changes

#admin.site.register(models.Profile)
admin.site.register(models.Apiary)
admin.site.register(models.Colony)
admin.site.register(models.Inspection)
admin.site.register(models.Transfer)
admin.site.register(models.Audit)
admin.site.register(models.Diary)
admin.site.register(models.Config)
admin.site.register(models.Message)
admin.site.register(models.Profile)
admin.site.register(models.Feedback)
admin.site.register(models.TreatmentType)
admin.site.register(models.Treatment)
admin.site.register(models.SizeChoice)
