// lib/add_gasto.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'gasto.dart';
import 'icons.dart';
import 'appbar/app_bar.dart';

class AddGasto extends StatefulWidget {
  final Function addGasto;

  const AddGasto(this.addGasto, {Key? key}) : super(key: key);

  @override
  _AddGastoState createState() => _AddGastoState();
}

class _AddGastoState extends State<AddGasto> {
  final _formKey = GlobalKey<FormState>();
  final _dataController = TextEditingController();

  String _titulo = '';
  double _valor = 0.0;
  DateTime _data = DateTime.now();
  IconData _categoriaIcone = Icons.category;
  Color _categoriaCor = Colors.black;

  @override
  void initState() {
    super.initState();
    _dataController.text = DateFormat('dd/MM/yyyy').format(_data);
  }

  Future<void> _pickIcon() async {
    final categoriaIcone = await showDialog<CategoriaIcone>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha um ícone'),
        content: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            children: categoriasIcones.map((categoriaIcone) {
              return IconButton(
                icon: Icon(categoriaIcone.icone, color: categoriaIcone.cor),
                onPressed: () => Navigator.of(context).pop(categoriaIcone),
              );
            }).toList(),
          ),
        ),
      ),
    );

    if (categoriaIcone != null) {
      setState(() {
        _categoriaIcone = categoriaIcone.icone;
        _categoriaCor = categoriaIcone.cor;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _data,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
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
      setState(() {
        _data = selectedDate;
        _dataController.text = DateFormat('dd/MM/yyyy').format(_data);
      });
    }
  }

  void _showCustomSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final novoGasto = Gasto(
        titulo: _titulo,
        valor: _valor,
        data: _data,
        categoriaIcone: _categoriaIcone,
        categoriaCor: _categoriaCor,
      );
      widget.addGasto(novoGasto);
      Navigator.pop(context);
    } else {
      _showCustomSnackBar(context, 'Preencha todos os campos');
    }
  }

  InputDecoration _buildInputDecoration(String labelText,
      {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.grey[200],
      suffixIcon: suffixIcon,
    );
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
        child: Column(
          children: [
            const SizedBox(height: 40.0), // Increased margin below AppBar
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: _buildInputDecoration('Título'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um título';
                      }
                      return null;
                    },
                    onSaved: (value) => _titulo = value!,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: _buildInputDecoration('Valor'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um valor';
                      }
                      return null;
                    },
                    onSaved: (value) => _valor = double.parse(value!),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _dataController,
                    decoration: _buildInputDecoration('Data'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecione uma data';
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await _selectDate(context);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Categoria',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: _pickIcon,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Icon(
                                _categoriaIcone,
                                color: _categoriaCor,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        if (_categoriaIcone == Icons.category &&
                            _categoriaCor == Colors.black)
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Por favor, selecione uma categoria',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.0),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: _saveForm,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text(
                "Preencha os campos e Clique em 'Salvar' para adicionar um novo gasto",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.8),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.help_outline),
      ),
    );
  }
}
