import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Importe o pacote flutter_localizations
import 'pages/home_page.dart';
import 'pages/start_page.dart'; // Importe o arquivo start.dart

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // Defina a variável logado
  bool logado = false;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: logado
          ? HomePage()
          : StartPage(), // Se logado for true, HomePage é chamada, senão StartPage é chamada
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
