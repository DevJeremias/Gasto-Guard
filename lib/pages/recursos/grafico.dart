import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../icons.dart'; // Certifique-se de que o caminho para icons.dart está correto

class PieChartWidget extends StatefulWidget {
  final Map<String, double> dataMap;
  final Map<String, Color> colorList;
  final Map<String, IconData> iconList;

  PieChartWidget(
      {required this.dataMap, required this.colorList, required this.iconList});

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();

  static PieChartWidget createWithSampleData() {
    Map<String, double> dataMap = {
      for (var categoria in categoriasIcones)
        categoria.nome: categoria.valor_gasto,
    };

    Map<String, Color> colorList = {
      for (var categoria in categoriasIcones) categoria.nome: categoria.cor,
    };

    Map<String, IconData> iconList = {
      for (var categoria in categoriasIcones) categoria.nome: categoria.icone,
    };

    return PieChartWidget(
        dataMap: dataMap, colorList: colorList, iconList: iconList);
  }
}

class _PieChartWidgetState extends State<PieChartWidget> {
  bool _showLegend = false;

  void _toggleLegend() {
    setState(() {
      _showLegend = !_showLegend;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLegend,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PieChart(
                    dataMap: widget.dataMap,
                    colorList: widget.colorList.values.toList(),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                    animationDuration: Duration(milliseconds: 800),
                  ),
                ),
                if (_showLegend)
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildLegend(),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      children: widget.dataMap.keys.map((category) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Icon(widget.iconList[category],
                  color: widget.colorList[category]),
              SizedBox(width: 8),
              Expanded(child: Text(category)),
              Text('${widget.dataMap[category]}%'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
