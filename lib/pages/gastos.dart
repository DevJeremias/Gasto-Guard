import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'gasto.dart'; // Importe a classe Gasto
import 'add_gasto.dart'; // Importe a classe AddGasto
import 'appbar/app_bar.dart'; // Importe a classe CustomAppBar

// Esta é a sua página de gastos
class GastosPage extends StatefulWidget {
  final Function(List<Gasto>) onGastosUpdated;

  GastosPage({required this.onGastosUpdated});

  @override
  _GastosPageState createState() =>
      _GastosPageState(); // Alterado de '_CategoriesPageState' para '_GastosPageState'
}

class _GastosPageState extends State<GastosPage> {
  // Esta é a lista de gastos
  final List<Gasto> _gastos = [];

  // Esta é a cor do ícone
  Color _iconColor = Colors.black;

  // Este método adiciona um gasto à lista de gastos
  void _addGasto(Gasto gasto) {
    setState(() {
      _gastos.add(gasto);
      widget.onGastosUpdated(_gastos);
    });
  }

  // Este método mostra um diálogo para escolher uma cor
  void _showColorPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _iconColor,
              onColorChanged: (Color color) {
                setState(() {
                  _iconColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        margin: EdgeInsets.all(10.0), // Adicionado margem de 10.0
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Bem-vindo à página de Gastos!'), // Alterado de 'Categorias' para 'Gastos'
            Expanded(
              child: ListView(
                children: _gastos.map((gasto) => GastoWidget(gasto)).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGasto(_addGasto)),
          );
        },
        label: Text('Adicionar Gasto', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
