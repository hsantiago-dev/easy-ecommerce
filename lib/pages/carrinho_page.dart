import 'package:easy/repositories/carrinho_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CarrinhoPage extends StatefulWidget {
  CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Carrinho',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Local de entrega',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.place,
                          size: 30,
                          color: Color(0xFF28D890),
                        ),
                      ),
                      title: Text(
                        'Avenida Ernani Batista Rosas',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: const Text('3131, Jardim Carvalho.'),
                      trailing: const Icon(
                        Icons.navigate_next,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(5),
                color: Colors.white,
                child: Consumer<CarrinhoRepository>(
                    builder: (context, carrinho, child) {
                  return carrinho.lista.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Ainda não há nada no seu carrinho.',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                height: 150,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.3)),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.asset(
                                        carrinho.lista[index].foto,
                                        height: 110,
                                        width: 110,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 15,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  carrinho.lista[index].nome,
                                                  style: GoogleFonts.lexendDeca(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'R\$ ${carrinho.lista[index].valor}',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    color: Color(0xFF28D890),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        carrinho
                                                            .removeQuantidade(
                                                                carrinho.lista[
                                                                    index],
                                                                carrinho
                                                                    .lista[
                                                                        index]
                                                                    .quantidade);
                                                      },
                                                      icon: (carrinho
                                                                  .lista[index]
                                                                  .quantidade ==
                                                              1)
                                                          ? const Icon(
                                                              Icons.delete,
                                                              color: Color(
                                                                  0xFF28D890),
                                                            )
                                                          : const Icon(
                                                              Icons.remove,
                                                              color: Color(
                                                                  0xFF28D890)),
                                                    ),
                                                    Text(
                                                        '${carrinho.lista[index].quantidade}'),
                                                    IconButton(
                                                      onPressed: () {
                                                        carrinho.addQuantidade(
                                                            carrinho
                                                                .lista[index],
                                                            carrinho
                                                                .lista[index]
                                                                .quantidade);
                                                      },
                                                      icon: const Icon(
                                                        Icons.add,
                                                        color:
                                                            Color(0xFF28D890),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, ___) => const Divider(),
                          itemCount: carrinho.lista.length,
                        );
                }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CarrinhoRepository>(
                  builder: (context, carrinho, child) {
                    return Text(
                      real.format(carrinho.total),
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        color: Color(0xFF28D890),
                      ),
                    );
                  },
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Color(0xFF0EC4B7), Color(0xFF28D890)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cartao');
                    },
                    child: Text(
                      'CONTINUAR',
                      style: GoogleFonts.inter(fontSize: 18),
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
