import 'package:flutter/material.dart';

// Classe CategoriaIcone que representa uma categoria e seu ícone correspondente
class CategoriaIcone {
  final String nome;
  final IconData icone;
  final Color cor; // Adicionando um campo de cor

  CategoriaIcone(
      this.nome, this.icone, this.cor); // Adicionando cor ao construtor
}

// Lista de categorias e seus ícones correspondentes
List<CategoriaIcone> categoriasIcones = [
  CategoriaIcone('padaria', Icons.cake, Colors.red),
  CategoriaIcone('farmacia', Icons.local_pharmacy, Colors.orange),
  CategoriaIcone('mercado', Icons.shopping_cart, Colors.yellow),
  CategoriaIcone('hospital', Icons.local_hospital, Colors.green),
  CategoriaIcone('ensino', Icons.school, Colors.blue),
  CategoriaIcone('lanche', Icons.fastfood, Colors.indigo),
  CategoriaIcone('comida', Icons.restaurant, Colors.purple),
  CategoriaIcone('lazer', Icons.beach_access, Colors.pink),
  CategoriaIcone('investimento', Icons.trending_up, Colors.teal),
  CategoriaIcone('transporte', Icons.directions_bus, Colors.cyan),
  CategoriaIcone('outro', Icons.more_horiz, Colors.brown),
];
