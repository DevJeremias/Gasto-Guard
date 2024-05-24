import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'gasto.dart'; // Importe a classe Gasto
import 'add_gasto.dart'; // Importe a classe AddGasto

// Esta é a sua página de gastos
class GastosPage extends StatefulWidget {
  // Alterado de 'CategoriesPage' para 'GastosPage'
  @override
  _GastosPageState createState() =>
      _GastosPageState(); // Alterado de '_CategoriesPageState' para '_GastosPageState'
}

class _GastosPageState extends State<GastosPage> {
  // Alterado de '_CategoriesPageState' para '_GastosPageState'
  // Esta é a lista de gastos
  final List<Gasto> _gastos = [];
  // Esta é a cor do ícone
  Color _iconColor = Colors.black;

  // Este método adiciona um gasto à lista de gastos
  void _addGasto(Gasto gasto) {
    setState(() {
      _gastos.add(gasto);
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
      appBar: AppBar(
        title: Text('Gasto Guard'),
      ),
      body: Container(
        // Adicionado um Container para ocupar toda a tela
        margin: EdgeInsets.all(10.0), // Adicionado margem de 10.0
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Bem-vindo à página de Gastos!'), // Alterado de 'Categorias' para 'Gastos'
            Expanded(
              // Adicionado um widget Expanded para ocupar o espaço restante
              child: ListView(
                // Adicionado um ListView para exibir a lista de gastos
                children: _gastos.map((gasto) => GastoWidget(gasto)).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Adicionado um FloatingActionButton
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGasto(_addGasto)),
          );
        },
      ),
    );
  }
}
