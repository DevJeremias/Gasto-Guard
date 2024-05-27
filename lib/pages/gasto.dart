import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para usar o DateFormat

// Classe Gasto que representa um gasto
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

// Classe GastoWidget que representa um widget de gasto
class GastoWidget extends StatelessWidget {
  final Gasto gasto;

  GastoWidget(this.gasto);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(gasto.categoriaIcone, color: gasto.categoriaCor),
        title: Text(gasto.titulo),
        subtitle: Text(
          'Valor: ${gasto.valor}\nData: ${DateFormat('dd/MM/yyyy').format(gasto.data)}',
        ),
      ),
    );
  }
}
