// ignore_for_file: unused_import
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'gasto.dart';
import 'add_gasto.dart';
import 'appbar/app_bar.dart';
import 'gasto_provider.dart';

class GastosPage extends StatelessWidget {
  const GastosPage({super.key});

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
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<GastoProvider>(
              builder: (context, gastoProvider, child) {
                if (gastoProvider.gastos.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Nenhum gasto adicionado no momento.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: gastoProvider.gastos.length,
                      itemBuilder: (context, index) {
                        final gasto = gastoProvider.gastos[index];
                        return Dismissible(
                          key: Key(gasto.titulo),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            gastoProvider.removeGasto(gasto);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${gasto.titulo} removido'),
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(gasto.categoriaIcone,
                                color: gasto.categoriaCor),
                            title: Text(gasto.titulo),
                            subtitle: Text(
                                DateFormat('dd/MM/yyyy').format(gasto.data)),
                            trailing:
                                Text('R\$ ${gasto.valor.toStringAsFixed(2)}'),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddGasto(
                      (gasto) {
                        Provider.of<GastoProvider>(context, listen: false)
                            .addGasto(gasto);
                      },
                    )),
          );
        },
        label: const Text('Adicionar Gasto',
            style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
