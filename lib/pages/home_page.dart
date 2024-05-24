import 'package:flutter/material.dart';
import 'appbar/app_bar.dart';
import 'gastos.dart'; // Alterado de 'categories.dart' para 'gastos.dart'
import 'recursos/grafico.dart'; // Adicione esta linha

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double total = 1000.00;
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Gasto Guard', showBackButton: false),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 3),
            PieChartWidget.createWithSampleData(), // Adicione esta linha
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'R\$ ' + total.toStringAsFixed(2),
                style: TextStyle(fontSize: 24),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GastosPage()), // Alterado de 'CategoriesPage()' para 'GastosPage()'
          );
        },
        label: Text('Ver Gastos', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
