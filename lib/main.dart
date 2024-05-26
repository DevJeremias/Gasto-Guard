import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/start_page.dart';
import 'pages/gasto_provider.dart';
import 'pages/categoria_provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool logado = false;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GastoProvider()),
        ChangeNotifierProvider(create: (_) => CategoriaProvider()),
      ],
      child: MaterialApp(
        title: 'App de Gastos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: logado ? HomePage() : StartPage(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt', 'BR'),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
