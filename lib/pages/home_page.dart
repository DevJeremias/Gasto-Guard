import 'package:flutter/material.dart';
import 'appbar/app_bar.dart';
import 'gastos.dart'; // Alterado de 'categories.dart' para 'gastos.dart'
import 'recursos/grafico.dart'; // Adicione esta linha
import 'gasto.dart'; // Importe a classe Gasto

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Gasto> _gastos = [];

  double get total {
    return _gastos.fold(0, (sum, item) => sum + item.valor);
  }

  void _updateGastos(List<Gasto> gastos) {
    setState(() {
      _gastos = gastos;
    });
  }

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
            PieChartWidget.createWithSampleData(), // Adicione esta linha
            SizedBox(height: 20), // Adicione esta linha
            Text(
              'Total de Gastos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Adicione esta linha
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'R\$ ' + total.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black), // Altere o tamanho da fonte e a cor
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
                builder: (context) => GastosPage(
                    onGastosUpdated:
                        _updateGastos)), // Passa o callback para atualizar os gastos
          );
        },
        label: Text('Ver Gastos', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
