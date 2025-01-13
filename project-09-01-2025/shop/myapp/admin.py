from django.contrib import admin
from .models import*
class staffAdmin(admin.ModelAdmin):
    list_display=('sname','semail','sphone','sphoto','spassword','address')



admin.site.register(staff,staffAdmin)
admin.site.register(feedback)
admin.site.register(product)
admin.site.register(login)