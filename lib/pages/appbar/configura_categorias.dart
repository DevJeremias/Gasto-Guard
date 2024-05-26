import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../icons.dart';
import '../recursos/icones.dart';
import '../categoria_provider.dart';

class ConfiguraCategorias extends StatefulWidget {
  const ConfiguraCategorias({Key? key}) : super(key: key);

  @override
  _ConfiguraCategoriasState createState() => _ConfiguraCategoriasState();
}

class _ConfiguraCategoriasState extends State<ConfiguraCategorias> {
  void abreDialogoEdicao(BuildContext context, CategoriaIcone categoria) {
    String nome = categoria.nome;
    IconData icone = categoria.icone;
    Color cor = categoria.cor;
    double valorGasto = categoria.valor_gasto;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar categoria'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: TextEditingController(text: nome),
                  onChanged: (value) {
                    nome = value;
                  },
                  decoration: InputDecoration(hintText: "Nome da categoria"),
                ),
                TextField(
                  controller:
                      TextEditingController(text: valorGasto.toString()),
                  onChanged: (value) {
                    valorGasto = double.parse(value);
                  },
                  decoration: InputDecoration(hintText: "Valor gasto"),
                  keyboardType: TextInputType.number,
                ),
                ColorPicker(
                  pickerColor: cor,
                  onColorChanged: (Color color) {
                    cor = color;
                  },
                  labelTypes: [], // Substituindo showLabel por labelTypes
                  pickerAreaHeightPercent: 0.8,
                ),
                ElevatedButton(
                  child: Text('Selecione um ícone'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Selecione um ícone'),
                          content: SingleChildScrollView(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: icones.map((iconeEscolhido) {
                                return IconButton(
                                  icon: Icon(iconeEscolhido),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      icone = iconeEscolhido;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                Provider.of<CategoriaProvider>(context, listen: false)
                    .modificaCategoria(
                  categoria.nome, // Nome original para encontrar a categoria
                  icone,
                  cor,
                  valorGasto,
                );
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
        title: const Text('Configurar Categorias',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<CategoriaProvider>(
        builder: (context, categoriaProvider, child) {
          return ListView.builder(
            itemCount: categoriaProvider.categorias.length,
            itemBuilder: (context, index) {
              final categoria = categoriaProvider.categorias[index];
              return ListTile(
                leading: Icon(categoria.icone, color: categoria.cor),
                title: Text(categoria.nome),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        abreDialogoEdicao(context, categoria);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<CategoriaProvider>(context, listen: false)
                            .removeCategoria(categoria.nome);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          criaCategoria(context);
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Adicionar Categoria',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void criaCategoria(BuildContext context) {
    String nome = '';
    IconData icone = Icons.cake;
    Color cor = Colors.red;
    double valorGasto = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Criar nova categoria'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    nome = value;
                  },
                  decoration:
                      const InputDecoration(hintText: "Nome da categoria"),
                ),
                TextField(
                  onChanged: (value) {
                    valorGasto = double.parse(value);
                  },
                  decoration: const InputDecoration(hintText: "Valor gasto"),
                  keyboardType: TextInputType.number,
                ),
                ColorPicker(
                  pickerColor: cor,
                  onColorChanged: (Color color) {
                    cor = color;
                  },
                  labelTypes: [], // Substituindo showLabel por labelTypes
                  pickerAreaHeightPercent: 0.8,
                ),
                ElevatedButton(
                  child: const Text('Selecione um ícone'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Selecione um ícone'),
                          content: SingleChildScrollView(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: icones.map((iconeEscolhido) {
                                return IconButton(
                                  icon: Icon(iconeEscolhido),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      icone = iconeEscolhido;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Criar'),
              onPressed: () {
                Provider.of<CategoriaProvider>(context, listen: false)
                    .adicionaCategoria(
                        CategoriaIcone(nome, icone, cor, valorGasto));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
