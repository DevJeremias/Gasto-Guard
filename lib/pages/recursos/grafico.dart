import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../icons.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, double> dataMap;
  final Map<String, Color> colorList;
  final Map<String, IconData> iconList;

  PieChartWidget(
      {required this.dataMap, required this.colorList, required this.iconList});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      colorList: colorList.values.toList(), // Adicionando as cores
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage:
            true, // Mostrando os valores em porcentagem
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      animationDuration: Duration(milliseconds: 800),
    );
  }

  static PieChartWidget createWithSampleData() {
    Map<String, double> dataMap = {
      for (var i = 0; i < categoriasIcones.length; i++)
        categoriasIcones[i].nome:
            categoriasIcones[i].valor_gasto, // Usando valor_gasto aqui
    };

    Map<String, Color> colorList = {
      for (var i = 0; i < categoriasIcones.length; i++)
        categoriasIcones[i].nome: categoriasIcones[i].cor,
    };

    Map<String, IconData> iconList = {
      for (var i = 0; i < categoriasIcones.length; i++)
        categoriasIcones[i].nome: categoriasIcones[i].icone,
    };

    return PieChartWidget(
        dataMap: dataMap, colorList: colorList, iconList: iconList);
  }
}
