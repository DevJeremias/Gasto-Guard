import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, double> dataMap;

  PieChartWidget({required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return PieChart(dataMap: dataMap);
  }

  static PieChartWidget createWithSampleData() {
    Map<String, double> dataMap = {
      "Fatia 1": 1,
      "Fatia 2": 2,
      "Fatia 3": 3,
      "Fatia 4": 4,
      "Fatia 5": 5,
      "Fatia 6": 6,
      "Fatia 7": 7,
      "Fatia 8": 8,
      "Fatia 9": 9,
      "Fatia 10": 10,
      "Fatia 11": 11,
    };
    return PieChartWidget(dataMap: dataMap);
  }
}
