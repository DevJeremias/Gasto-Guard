import 'package:flutter/material.dart';
import 'start_page.dart';
import 'home_page.dart';

class CadastrarPage extends StatelessWidget {
  CadastrarPage({Key? key}) : super(key: key);

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se no Gasto-Guard!',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StartPage()),
          ),
        ),
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
              TextField(
                controller: usuarioController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(color: Colors.blue), // Texto azul
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Borda azul
                  ),
                  fillColor: Colors.white, // Fundo branco
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blue), // Texto azul
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Borda azul
                  ),
                  fillColor: Colors.white, // Fundo branco
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.blue), // Texto azul
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
                child: Text('Cadastrar'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
