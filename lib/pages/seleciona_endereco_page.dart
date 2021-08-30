import 'package:easy/widgets/enderecos_entrega_widget.dart';
import 'package:flutter/material.dart';

class SelecionaEnderecoPage extends StatelessWidget {
  const SelecionaEnderecoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            children: [
              EnderecosEntregaWidget(
                selecionavel: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
