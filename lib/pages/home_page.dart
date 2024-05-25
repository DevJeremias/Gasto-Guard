import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appbar/app_bar.dart';
import 'gastos.dart';
import 'recursos/grafico.dart';
import 'gasto_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Gasto Guard',
        showBackButton: false,
        onSettingsPressed: () {},
        context: context,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 3),
            PieChartWidget.createWithSampleData(),
            SizedBox(height: 20),
            Text(
              'Total de Gastos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Consumer<GastoProvider>(
              builder: (context, gastoProvider, child) {
                return Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'R\$ ' + gastoProvider.totalGastos.toStringAsFixed(2),
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                );
              },
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GastosPage()),
          );
        },
        label: Text('Ver Gastos', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
