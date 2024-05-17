import 'package:flutter/material.dart';

class Gasto {
  final String titulo;
  final double valor;
  final DateTime data;
  final IconData categoriaIcone;
  final Color categoriaCor;

  Gasto({
    required this.titulo,
    required this.valor,
    required this.data,
    required this.categoriaIcone,
    required this.categoriaCor,
  });
}
