// Importando o pacote de material do Flutter
import 'package:flutter/material.dart';

// Classe Gasto que representa um gasto
class Gasto {
  // Título do gasto
  final String titulo;
  // Valor do gasto
  final double valor;
  // Data do gasto
  final DateTime data;
  // Ícone da categoria do gasto
  final IconData categoriaIcone;
  // Cor da categoria do gasto
  final Color categoriaCor;

  // Construtor da classe Gasto
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
  // Gasto que este widget representa
  final Gasto gasto;

  // Construtor da classe GastoWidget
  GastoWidget(this.gasto);

  // Método que constrói o widget
  @override
  Widget build(BuildContext context) {
    // Retorna um Card que contém um ListTile
    return Card(
      // ListTile é uma única linha fixa que normalmente contém algum texto e um ícone de liderança ou de ação final.
      child: ListTile(
        // Ícone de liderança do ListTile
        leading: Icon(gasto.categoriaIcone, color: gasto.categoriaCor),
        // Título do ListTile
        title: Text(gasto.titulo),
        // Subtítulo do ListTile
        subtitle: Text('Valor: ${gasto.valor}\nData: ${gasto.data}'),
      ),
    );
  }
}
