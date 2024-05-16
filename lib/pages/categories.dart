import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'gasto.dart'; // Importe a classe Gasto
import 'add_gasto.dart'; // Importe a classe AddGasto

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Gasto> _gastos = [];
  Color _iconColor = Colors.black;

  void _addGasto(Gasto gasto) {
    setState(() {
      _gastos.add(gasto);
    });
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bem-vindo à página de Categorias!'),
            ElevatedButton(
              child: Text('Adicionar Gasto'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddGasto(_addGasto)),
                );
              },
            ),
            ..._gastos.map((gasto) => Text(gasto.titulo)),
          ],
        ),
      ),
    );
  }
}
