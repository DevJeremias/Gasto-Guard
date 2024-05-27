import 'package:flutter/material.dart';

class CategoriaIcone {
  final String nome;
  IconData icone;
  Color cor;
  double valor_gasto;

  CategoriaIcone(this.nome, this.icone, this.cor, this.valor_gasto);
}

List<CategoriaIcone> categoriasIcones = [
  CategoriaIcone('padaria', Icons.cake, Colors.red, 0.0),
  CategoriaIcone('farmacia', Icons.local_pharmacy, Colors.orange, 0.0),
  CategoriaIcone('mercado', Icons.shopping_cart, Colors.yellow, 0.0),
  CategoriaIcone('hospital', Icons.local_hospital, Colors.green, 0.0),
  CategoriaIcone('ensino', Icons.school, Colors.blue, 0.0),
  CategoriaIcone('comida', Icons.restaurant, Colors.purple, 0.0),
  CategoriaIcone('lazer', Icons.beach_access,
      const Color.fromARGB(255, 242, 108, 152), 0.0),
  CategoriaIcone(
      'investimento', Icons.trending_up, Color.fromARGB(255, 12, 93, 38), 0.0),
  CategoriaIcone('transporte', Icons.directions_bus, Colors.cyan, 0.0),
  CategoriaIcone('outro', Icons.more_horiz, Colors.brown, 0.0),
];

void atualizarValorGasto(IconData icone, double valor) {
  final categoria = categoriasIcones.firstWhere((cat) => cat.icone == icone);
  categoria.valor_gasto += valor;
}

void removerValorGasto(IconData icone, double valor) {
  final categoria = categoriasIcones.firstWhere((cat) => cat.icone == icone);
  categoria.valor_gasto -= valor;
}
