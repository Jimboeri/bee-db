from django.contrib import admin
from .models import Profile, Apiary, Colony, Inspection, Transfer, Audit

# Register your models here.
admin.site.register(Profile)
admin.site.register(Apiary)
admin.site.register(Colony)
admin.site.register(Inspection)
admin.site.register(Transfer)
admin.site.register(Audit)
