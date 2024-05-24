import 'package:flutter/material.dart';

class ConfiguraCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações de Categorias'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à tela de Configurações de Categorias!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
