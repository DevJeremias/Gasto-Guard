import 'package:flutter/material.dart';

class ConfiguraPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações do Perfil',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        // Adiciona rolagem
        child: Container(
          padding: EdgeInsets.all(16.0), // Adiciona margem em todos os lados
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person,
                    size: 50, color: Colors.blue), // Ícone azul
              ),
              SizedBox(height: 20),
              Text('Nome de usuário',
                  style: TextStyle(color: Colors.blue)), // Texto azul
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Borda azul
                  ),
                  fillColor: Colors.white, // Fundo branco
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              Text('E-mail',
                  style: TextStyle(color: Colors.blue)), // Texto azul
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Borda azul
                  ),
                  fillColor: Colors.white, // Fundo branco
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              Text('Senha', style: TextStyle(color: Colors.blue)), // Texto azul
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Borda azul
                  ),
                  fillColor: Colors.white, // Fundo branco
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Cor do texto
                ),
                child: Text('Salvar'),
                onPressed: () {
                  // Adicione a funcionalidade de salvar aqui
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
