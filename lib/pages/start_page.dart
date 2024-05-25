import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cadastrar.dart';
import 'home_page.dart'; // Importe o pacote flutter_svg

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Substitua o Text pelo seu logotipo SVG
            SvgPicture.asset(
              'lib/logotipo/gasto_guard_logo.svg', // Caminho para o seu logotipo
              width: 100, // Defina a largura desejada
              height: 100, // Defina a altura desejada
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background color
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  // Navegue para a HomePage quando o botão "Entrar" for pressionado
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ou',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background color
                ),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  // Navegue para a CadastrarPage quando o botão "Cadastrar" for pressionado
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CadastrarPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
