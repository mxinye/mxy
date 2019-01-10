from django.contrib import admin

# Register your models here.
from clothes.models import User, Good

admin.site.register(User)
admin.site.register(Good)


