import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para usar o DateFormat
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
  String _categoria = '';

  // Adicione um TextEditingController para a data
  final _dataController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Inicialize o _dataController com a data atual
    _dataController.text = DateFormat('yyyy-MM-dd').format(_data);
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
              decoration: InputDecoration(labelText: 'Categoria'),
              onSaved: (value) {
                _categoria = value!;
              },
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
                    categoria: _categoria,
                  );

                  // Adicione o novo gasto à lista de gastos
                  widget.addGasto(novoGasto);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
