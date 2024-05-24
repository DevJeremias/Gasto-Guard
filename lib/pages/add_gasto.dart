import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para usar o DateFormat
import 'gasto.dart'; // Importe a classe Gasto
import 'icons.dart'; // Importe o arquivo icons.dart
import 'appbar/app_bar.dart'; // Importe a classe CustomAppBar

class AddGasto extends StatefulWidget {
  final Function addGasto;
  const AddGasto(this.addGasto);

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

  final _dataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dataController.text = DateFormat('dd/MM/yyyy').format(_data);
  }

  void _pickIcon() async {
    CategoriaIcone? categoriaIcone = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha um ícone'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              children: categoriasIcones.map((categoriaIcone) {
                return IconButton(
                  icon: Icon(categoriaIcone.icone, color: categoriaIcone.cor),
                  onPressed: () {
                    Navigator.of(context).pop(categoriaIcone);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (categoriaIcone != null) {
      setState(() {
        _categoriaIcone = categoriaIcone.icone;
        _categoriaCor = categoriaIcone.cor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Adicionar Gasto',
        showBackButton: false,
        onSettingsPressed: () {},
        context: context,
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
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                          ),
                          buttonTheme: const ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
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
                  suffixIcon: IconButton(
                    icon: Icon(_categoriaIcone, color: _categoriaCor),
                    onPressed: _pickIcon,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Gasto novoGasto = Gasto(
                      titulo: _titulo,
                      valor: _valor,
                      data: _data,
                      categoriaIcone: _categoriaIcone,
                      categoriaCor: _categoriaCor,
                    );

                    widget.addGasto(novoGasto);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
