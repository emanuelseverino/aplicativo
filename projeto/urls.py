from django.contrib import admin
from django.urls import path

from produto.views import ProdutoListView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', ProdutoListView.as_view(), name="produto-list"),
]
