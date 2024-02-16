from django.db import models

class Produto(models.Model):
    nome = models.CharField()
    preco = models.DecimalField()

    class Meta:
        verbose_name = 'Produto'
        verbose_name_plural = 'Produtos'

    def __str__(self):
        return self.nome
