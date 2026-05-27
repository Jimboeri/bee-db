"""bee URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin # type: ignore
from django.urls import path, include, re_path # type: ignore
from django.conf import settings # type: ignore
from django.views.static import serve # type: ignore

urlpatterns = [
    path("admin/", admin.site.urls),
    path("beedb/", include("beedb.urls")),
    # path('accounts/', include('django.contrib.auth.urls')),
    # Serve media files directly from Django (works regardless of DEBUG).
    # Acceptable for low-traffic / self-hosted deployments.
    re_path(r"^media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}),
]
