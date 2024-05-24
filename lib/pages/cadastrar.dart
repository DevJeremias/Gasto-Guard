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
        backgroundColor: Colors.blue,
        title: const Text(
          'Cadastre-se no Gasto-Guard!',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StartPage()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(30), // Aumentado o padding
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                      20), // Aumentado o arredondamento das bordas
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: usuarioController,
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Adicionado para evitar a animação do texto
                      ),
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Adicionado para evitar a animação do texto
                      ),
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: senhaController,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Adicionado para evitar a animação do texto
                      ),
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Cadastrar'),
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
