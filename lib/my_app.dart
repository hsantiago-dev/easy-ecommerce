import 'package:easy/pages/carrinho_page.dart';
import 'package:easy/pages/home_page.dart';
import 'package:easy/pages/login_page.dart';
import 'package:easy/pages/pedidos_page.dart';
import 'package:easy/pages/splash_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy!',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/carrinho": (context) => CarrinhoPage(),
        "/pedidos": (context) => PedidosPage(),
      },
    );
  }
}
