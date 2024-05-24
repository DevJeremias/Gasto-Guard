import 'package:flutter/material.dart';
import 'configura_perfil.dart';
import 'configura_categorias.dart';
import '../start_page.dart';

class Configura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0), // adiciona uma margem em todos os lados
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // alinha os itens à esquerda
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 5.0), // reduz a margem na parte inferior
              decoration: BoxDecoration(
                color: Colors.blue, // retângulo azul
                borderRadius:
                    BorderRadius.circular(10.0), // bordas arredondadas
              ),
              child: ListTile(
                title: Text('Perfil',
                    style: TextStyle(color: Colors.white)), // letras brancas
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfiguraPerfil()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: 5.0), // reduz a margem na parte inferior
              decoration: BoxDecoration(
                color: Colors.blue, // retângulo azul
                borderRadius:
                    BorderRadius.circular(10.0), // bordas arredondadas
              ),
              child: ListTile(
                title: Text('Categorias',
                    style: TextStyle(color: Colors.white)), // letras brancas
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfiguraCategorias()),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center, // centraliza o botão "Sair"
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, // foreground
                  ),
                  child: Text('Sair'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => StartPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
