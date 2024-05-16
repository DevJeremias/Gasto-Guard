import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key, required this.titleText, required this.showBackButton})
      : super(
          key: key,
          title: Text(
            titleText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          leading: showBackButton ? BackButton(color: Colors.white) : null,
        );

  final String titleText;
  final bool showBackButton;
}
