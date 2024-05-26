import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../categoria_provider.dart';

class PieChartWidget extends StatefulWidget {
  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();

  static PieChartWidget createWithSampleData() {
    return PieChartWidget();
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
    return Consumer<CategoriaProvider>(
      builder: (context, categoriaProvider, child) {
        Map<String, double> dataMap = {
          for (var categoria in categoriaProvider.categorias)
            categoria.nome: categoria.valor_gasto,
        };

        List<Color> colorList =
            categoriaProvider.categorias.map((cat) => cat.cor).toList();

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
                        dataMap: dataMap,
                        colorList: colorList,
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
                          child: _buildLegend(categoriaProvider),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegend(CategoriaProvider categoriaProvider) {
    return Column(
      children: categoriaProvider.categorias.map((categoria) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Icon(categoria.icone, color: categoria.cor),
              SizedBox(width: 8),
              Expanded(child: Text(categoria.nome)),
              Text('R\$ ${categoria.valor_gasto.toStringAsFixed(2)}'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
