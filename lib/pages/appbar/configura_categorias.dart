import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../icons.dart';
import '../recursos/icones.dart';

class ConfiguraCategorias extends StatefulWidget {
  @override
  _ConfiguraCategoriasState createState() => _ConfiguraCategoriasState();
}

class _ConfiguraCategoriasState extends State<ConfiguraCategorias> {
  List<CategoriaIcone> categorias = categoriasIcones;

  void adicionaCategoria(CategoriaIcone novaCategoria) {
    setState(() {
      categorias.add(novaCategoria);
    });
  }

  void removeCategoria(String nome) {
    setState(() {
      categorias.removeWhere((categoria) => categoria.nome == nome);
    });
  }

  void modificaCategoria(
      String nome, IconData icone, Color cor, double valor_gasto) {
    setState(() {
      int index = categorias.indexWhere((categoria) => categoria.nome == nome);
      if (index != -1) {
        categorias[index] = CategoriaIcone(nome, icone, cor, valor_gasto);
      }
    });
  }

  void modificaIconeCategoria(String nome, IconData novoIcone) {
    setState(() {
      int index = categorias.indexWhere((categoria) => categoria.nome == nome);
      if (index != -1) {
        categorias[index].icone = novoIcone;
      }
    });
  }

  void selecionaIcone(BuildContext context, String nomeCategoria) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione um novo ícone'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: icones.map((icone) {
                return IconButton(
                  icon: Icon(icone),
                  onPressed: () {
                    modificaIconeCategoria(nomeCategoria, icone);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void criaCategoria(BuildContext context) {
    String nome = '';
    IconData icone = Icons.cake;
    Color cor = Colors.red;
    double valor_gasto = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Criar nova categoria'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    nome = value;
                  },
                  decoration: InputDecoration(hintText: "Nome da categoria"),
                ),
                TextField(
                  onChanged: (value) {
                    valor_gasto = double.parse(value);
                  },
                  decoration: InputDecoration(hintText: "Valor gasto"),
                  keyboardType: TextInputType.number,
                ),
                ColorPicker(
                  pickerColor: cor,
                  onColorChanged: (Color color) {
                    cor = color;
                  },
                  showLabel: true,
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
                                    icone = iconeEscolhido;
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
                adicionaCategoria(
                    CategoriaIcone(nome, icone, cor, valor_gasto));
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
        title: Text('Configurar Categorias',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Icon(categorias[index].icone, color: categorias[index].cor),
            title: Text(categorias[index].nome),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    selecionaIcone(context, categorias[index].nome);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Escolha uma cor'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: categorias[index].cor,
                              onColorChanged: (Color color) {
                                setState(() {
                                  categorias[index].cor = color;
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
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeCategoria(categorias[index].nome);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          criaCategoria(context);
        },
        icon: Icon(Icons.add, color: Colors.white),
        label:
            Text('Adicionar Categoria', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
