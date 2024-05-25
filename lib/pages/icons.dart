import 'package:flutter/material.dart';

class CategoriaIcone {
  final String nome;
  IconData icone;
  Color cor;
  final double valor_gasto; // Adicionando um campo para o valor gasto

  CategoriaIcone(this.nome, this.icone, this.cor,
      this.valor_gasto); // Adicionando valor_gasto ao construtor
}

List<CategoriaIcone> categoriasIcones = [
  CategoriaIcone('padaria', Icons.cake, Colors.red, 15.0),
  CategoriaIcone('farmacia', Icons.local_pharmacy, Colors.orange, 15.0),
  CategoriaIcone('mercado', Icons.shopping_cart, Colors.yellow, 15.0),
  CategoriaIcone('hospital', Icons.local_hospital, Colors.green, 15.0),
  CategoriaIcone('ensino', Icons.school, Colors.blue, 15.0),
  CategoriaIcone('comida', Icons.restaurant, Colors.purple, 15.0),
  CategoriaIcone('lazer', Icons.beach_access,
      const Color.fromARGB(255, 242, 108, 152), 15.0),
  CategoriaIcone(
      'investimento', Icons.trending_up, Color.fromARGB(255, 12, 93, 38), 15.0),
  CategoriaIcone('transporte', Icons.directions_bus, Colors.cyan, 15.0),
  CategoriaIcone('outro', Icons.more_horiz, Colors.brown, 15.0),
];
