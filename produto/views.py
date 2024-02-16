from django.views.generic import ListView

from produto.models import Produto


class ProdutoListView(ListView):
    model = Produto
