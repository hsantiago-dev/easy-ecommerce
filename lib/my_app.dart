import 'package:easy/pages/carrinho_page.dart';
import 'package:easy/pages/cartao/cartao_page.dart';
import 'package:easy/pages/home_page.dart';
import 'package:easy/pages/login_page.dart';
import 'package:easy/pages/pedidos_page.dart';
import 'package:easy/pages/seleciona_endereco_page.dart';
import 'package:easy/pages/splash_page.dart';
import 'package:easy/pages/usuario/usuario_page.dart';
import 'package:easy/services/auth_service.dart';
import 'package:easy/widgets/auth_check.dart';
import 'package:easy/widgets/formulario_endereco_entrega/formulario_endereco_entrega.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        "/login": (context) => const LoginPage(),
        "/home": (context) => HomePage(
              auth: context.read<AuthService>(),
            ),
        "/carrinho": (context) => CarrinhoPage(),
        "/pedidos": (context) => const PedidosPage(),
        "/cartao": (context) => const CartaoPage(),
        "/auth_check": (context) => const AuthCheck(),
        "/usuario": (context) => const UsuarioPage(),
        "/formulario_endereco": (context) => const FormularioEnderecoEntrega(),
        "/seleciona_endereco": (context) => const SelecionaEnderecoPage(),
      },
    );
  }
}
