import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para usar o DateFormat
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'gasto.dart'; // Importe a classe Gasto

class AddGasto extends StatefulWidget {
  final Function addGasto;
  AddGasto(this.addGasto);

  @override
  _AddGastoState createState() => _AddGastoState();
}

class _AddGastoState extends State<AddGasto> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  double _valor = 0.0;
  DateTime _data = DateTime.now();
  IconData _categoriaIcone = Icons.category;
  Color _categoriaCor = Colors.black;

  // Adicione um TextEditingController para a data
  final _dataController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Inicialize o _dataController com a data atual
    _dataController.text = DateFormat('yyyy-MM-dd').format(_data);
  }

  void _pickIcon() async {
    // Removi a função de seleção de ícone devido a um erro na instrução de importação.
    Color? color = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _categoriaCor,
              onColorChanged: (Color color) {
                setState(() {
                  _categoriaCor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              // Alterado de FlatButton para TextButton, pois FlatButton está obsoleto.
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(_categoriaCor);
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
        title: Text('Adicionar Gasto'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              onSaved: (value) {
                _titulo = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _valor = double.parse(value!);
              },
            ),
            TextFormField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Data'),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                _data = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ))!;
                _dataController.text = DateFormat('yyyy-MM-dd').format(_data);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Categoria',
                suffixIcon: IconButton(
                  icon: Icon(_categoriaIcone, color: _categoriaCor),
                  onPressed: _pickIcon,
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Crie um novo objeto Gasto
                  Gasto novoGasto = Gasto(
                    titulo: _titulo,
                    valor: _valor,
                    data: _data,
                    categoriaIcone: _categoriaIcone,
                    categoriaCor: _categoriaCor,
                  );

                  // Adicione o novo gasto à lista de gastos
                  widget.addGasto(novoGasto);

                  // Feche a tela atual e volte para a tela anterior
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
