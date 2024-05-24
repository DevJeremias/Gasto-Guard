import 'package:flutter/material.dart';

class Configura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à tela de Configurações!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
