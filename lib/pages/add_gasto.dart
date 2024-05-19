import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // Importe o pacote intl para usar o DateFormat
import 'gasto.dart'; // Importe a classe Gasto
import 'icons.dart'; // Importe o arquivo icons.dart

class AddGasto extends StatefulWidget {
  final Function addGasto;
  // ignore: use_key_in_widget_constructors
  const AddGasto(this.addGasto);

  @override
  // ignore: library_private_types_in_public_api
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

    // Inicialize o _dataController com a data atual no formato 'dia/mês/ano'
    _dataController.text = DateFormat('dd/MM/yyyy').format(_data);
  }

  void _pickIcon() async {
    // Função para selecionar um ícone
    IconData? icon = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha um ícone'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              children: categoriasIcones.map((categoriaIcone) {
                return IconButton(
                  icon: Icon(categoriaIcone.icone),
                  onPressed: () {
                    Navigator.of(context).pop(categoriaIcone.icone);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (icon != null) {
      setState(() {
        _categoriaIcone = icon;
      });
    }
  }

  void _pickColor() async {
    // Função para selecionar uma cor
    // ignore: unused_local_variable
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
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
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
        // ignore: prefer_const_constructors
        title: Text('Adicionar Gasto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Título'),
                onSaved: (value) {
                  _titulo = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _valor = double.parse(value!);
                },
              ),
              TextFormField(
                controller: _dataController,
                decoration: const InputDecoration(labelText: 'Data'),
                onTap: () async {
                  // ignore: unnecessary_new
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.blue, // Cor do cabeçalho
                            onPrimary:
                                Colors.white, // Cor do texto no cabeçalho
                          ),
                          buttonTheme: const ButtonThemeData(
                            textTheme: ButtonTextTheme
                                .primary, // Cor do botão 'OK' e 'Cancelar'
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (selectedDate != null) {
                    _data = selectedDate;
                    _dataController.text =
                        DateFormat('dd/MM/yyyy').format(_data);
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(_categoriaIcone, color: _categoriaCor),
                        onPressed: _pickIcon,
                      ),
                      IconButton(
                        icon: Icon(Icons.color_lens, color: _categoriaCor),
                        onPressed: _pickColor,
                      ),
                    ],
                  ),
                ),
              ),
              // Adicione um SizedBox para criar uma margem acima do botão
              const SizedBox(height: 20.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Botão azul
                ),
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
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white, // Letras brancas
                    fontWeight: FontWeight.bold, // Letras em negrito
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
