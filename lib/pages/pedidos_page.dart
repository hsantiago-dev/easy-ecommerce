import 'package:easy/models/pedido.dart';
import 'package:easy/models/produto.dart';
import 'package:easy/repositories/pedidos_repository.dart';
import 'package:easy/widgets/circle_icon_button.dart';
import 'package:easy/widgets/modal_detalhes_pedido.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    final pedidos = PedidosRepository.pedidos;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Seus Pedidos',
            style: GoogleFonts.inter(
              fontSize: 22,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleIconButton(
                        onTap: () {},
                        icon: Icons.local_shipping,
                        selecionado: true,
                      ),
                      Text(
                        'A caminho',
                        style: GoogleFonts.lexendDeca(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleIconButton(
                        onTap: () {},
                        icon: Icons.check_circle,
                      ),
                      Text(
                        'Entregues',
                        style: GoogleFonts.lexendDeca(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ModalDetalhesPedido(
                          pedido: pedidos[index],
                        ),
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Pedido: ${pedidos[index].numeroPedido}',
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      pedidos[index].produtos[0].foto,
                                      width: 70,
                                    ),
                                    (pedidos[index].produtos.length >= 2)
                                        ? Image.asset(
                                            pedidos[index].produtos[1].foto,
                                            width: 70,
                                          )
                                        : Container(),
                                    (pedidos[index].produtos.length >= 3)
                                        ? Image.asset(
                                            pedidos[index].produtos[2].foto,
                                            width: 70,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  'Valor total: ${real.format(pedidos[index].valorTotal)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF28D890),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  'Estimativa de entrega: ${pedidos[index].dataEntrega}',
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, ___) => const Divider(),
                itemCount: pedidos.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
