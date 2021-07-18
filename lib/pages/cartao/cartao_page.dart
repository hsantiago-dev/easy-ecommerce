import 'package:easy/pages/cartao/cartao_controller.dart';
import 'package:easy/repositories/carrinho_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartaoPage extends StatefulWidget {
  const CartaoPage({Key? key}) : super(key: key);

  @override
  State<CartaoPage> createState() => _CartaoPageState();
}

class _CartaoPageState extends State<CartaoPage> {
  final controller = CartaoController();
  final vencimentoInputTextController =
      MaskedTextController(mask: '00/00/0000');
  final numeroCartaoInputTextController =
      MaskedTextController(mask: '0000 0000 0000 0000');

  late CarrinhoRepository carrinho;

  String formatarNumeroCartao(String value) {
    var numeroFormatado = '';

    for (var i = 0; i < value.length; i++) {
      if (i % 4 == 0) {
        numeroFormatado += ' ';
      }
      numeroFormatado += value[i];
    }

    return numeroFormatado;
  }

  String formatarVencimento(String value) {
    var numeroFormatado = '';
    var limite = 2;

    for (var i = 0; i < value.length; i++) {
      if (i != 0 && i % 2 == 0 && limite > 0) {
        numeroFormatado += '/';
        limite--;
      }
      numeroFormatado += value[i];
    }

    return numeroFormatado;
  }

  @override
  Widget build(BuildContext context) {
    carrinho = Provider.of<CarrinhoRepository>(context);

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF353538),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        (controller.model.numeroCartao != null)
                            ? formatarNumeroCartao(
                                controller.model.numeroCartao!)
                            : '0000 0000 0000 0000',
                        style: GoogleFonts.sourceCodePro(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nome do titular',
                                    style: GoogleFonts.sourceCodePro(
                                      fontSize: 12,
                                      color: Color(0xFF666568),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      (controller.model.nomeTitular != null)
                                          ? controller.model.nomeTitular!
                                          : 'ABCDEFGHIJKLMNOPQRST',
                                      style: GoogleFonts.sourceCodePro(
                                        fontSize: 10,
                                        color: Color(0xFF929194),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Vencimento',
                                  style: GoogleFonts.sourceCodePro(
                                    fontSize: 12,
                                    color: Color(0xFF666568),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    (controller.model.vencimento != null)
                                        ? formatarVencimento(
                                            controller.model.vencimento!)
                                        : '00/00/0000',
                                    style: GoogleFonts.sourceCodePro(
                                      fontSize: 10,
                                      color: Color(0xFF929194),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Digite os detalhes do cartão:',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.onChange(numeroCartao: value),
                          validator: controller.validarNumeroCartao,
                          controller: numeroCartaoInputTextController,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Número do cartão',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.onChange(nomeTitular: value),
                          validator: controller.validarNomeTitular,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome do titular',
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.onChange(vencimento: value),
                          validator: controller.validarVencimento,
                          controller: vencimentoInputTextController,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Vencimento do cartão',
                          ),
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.onChange(codigoSeguranca: value),
                          validator: controller.validarCodigoSeguranca,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF0EC4B7), Color(0xFF28D890)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        carrinho.limparCarrinho();

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Compra realizada com sucesso!')));
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_forward),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'FINALIZAR COMPRA',
                            style: GoogleFonts.inter(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
