import 'package:flutter/material.dart';

// Classe CategoriaIcone que representa uma categoria e seu ícone correspondente
class CategoriaIcone {
  final String nome;
  final IconData icone;

  CategoriaIcone(this.nome, this.icone);
}

// Lista de categorias e seus ícones correspondentes
List<CategoriaIcone> categoriasIcones = [
  CategoriaIcone('padaria', Icons.cake),
  CategoriaIcone('farmacia', Icons.local_pharmacy),
  CategoriaIcone('mercado', Icons.shopping_cart),
  CategoriaIcone('hospital', Icons.local_hospital),
  CategoriaIcone('ensino', Icons.school),
  CategoriaIcone('lanche', Icons.fastfood),
  CategoriaIcone('comida', Icons.restaurant),
  CategoriaIcone('outro', Icons.more_horiz),
  CategoriaIcone('lazer', Icons.beach_access),
  CategoriaIcone('investimento', Icons.trending_up),
  CategoriaIcone('transporte', Icons.directions_bus),
];
