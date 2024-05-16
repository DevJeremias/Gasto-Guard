import 'package:flutter/material.dart';
import 'appbar/app_bar.dart'; // atualizado aqui

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Gasto Guard', showBackButton: true),
      body: Center(
        child: Text('Bem-vindo à página de Categorias!'),
      ),
    );
  }
}
