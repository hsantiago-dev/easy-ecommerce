import 'package:easy/repositories/carrinho_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoRepository(),
      child: MyApp(),
    ),
  );
}
