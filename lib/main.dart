import 'package:easy/repositories/carrinho_repository.dart';
import 'package:easy/repositories/produto_repository.dart';
import 'package:easy/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarrinhoRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProdutoRepository(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
