import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Importe o pacote flutter_localizations
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      localizationsDelegates: [
        // Adicione esta linha
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // Adicione esta linha
        const Locale('pt', 'BR'), // Português do Brasil
      ],
    );
  }
}
