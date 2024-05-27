import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'configura.dart'; // Certifique-se de que o caminho do import esteja correto

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required this.titleText,
    required this.showBackButton,
    required BuildContext context,
    required Null Function() onSettingsPressed,
  }) : super(
          key: key,
          title: Row(
            children: [
              // Adicione o logotipo como um ícone pequeno
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'lib/logotipo/gasto_guard_logo.svg', // Caminho para o seu logotipo
                  width: 35, // Defina o tamanho desejado para o ícone
                  height: 35,
                  color: Colors.white, // Altere a cor do ícone para branco
                ),
              ),
              Text(
                titleText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue,
          leading: showBackButton ? BackButton(color: Colors.white) : null,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Configura()),
                );
              },
            ),
          ],
        );

  final String titleText;
  final bool showBackButton;
}
