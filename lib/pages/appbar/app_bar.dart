import 'package:flutter/material.dart';
import 'configura.dart'; // Certifique-se de que o caminho do import esteja correto

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key,
      required this.titleText,
      required this.showBackButton,
      required BuildContext context,
      required Null Function() onSettingsPressed})
      : super(
          key: key,
          title: Text(
            titleText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
