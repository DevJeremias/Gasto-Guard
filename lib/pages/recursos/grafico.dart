import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../icons.dart';
// Importando o arquivo icons.dart

class PieChartWidget extends StatelessWidget {
  final Map<String, double> dataMap;

  PieChartWidget({required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return PieChart(dataMap: dataMap);
  }

  static PieChartWidget createWithSampleData() {
    // Criando um Map com os nomes das categorias e um valor de exemplo
    Map<String, double> dataMap = {
      for (var i = 0; i < categoriasIcones.length; i++)
        categoriasIcones[i].nome: (i + 1).toDouble(),
    };
    return PieChartWidget(dataMap: dataMap);
  }
}
