import 'package:flutter/material.dart';
import 'appbar/app_bar.dart'; // atualizado aqui
import 'categories.dart'; // importe da página de categorias

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Gasto Guard', showBackButton: false),
      body: Center(
        child: Text('Bem-vindo à Página Inicial!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
          );
        },
        child: Icon(Icons.list, color: Colors.white), // ícone categorias
        backgroundColor: Colors.blue,
      ),
    );
  }
}
