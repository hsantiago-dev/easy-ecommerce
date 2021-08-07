import 'package:easy/pages/produto_page.dart';
import 'package:easy/repositories/produto_repository.dart';
import 'package:easy/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height / 1.9) / 1.5;
    final double itemWidth = size.width / 2;

    irParaCarrinho() {
      Navigator.pushNamed(context, '/carrinho');
    }

    irParaPedidos() {
      Navigator.pushNamed(context, '/pedidos');
    }

    mostrarProduto(produto) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProdutoPage(produto: produto),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/images/easy.png',
                      width: 55,
                    ),
                    title: Text(
                      'Bem vindo!',
                      style: GoogleFonts.lexendDeca(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, right: 30, left: 30),
                    height: 45,
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'O que você procura?',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF28D890),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIconButton(
                        onTap: irParaCarrinho,
                        icon: Icons.shopping_cart,
                      ),
                      CircleIconButton(
                        onTap: irParaPedidos,
                        icon: Icons.view_agenda,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text(
                'Produtos.',
                textAlign: TextAlign.start,
                style: GoogleFonts.lexendDeca(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: Consumer<ProdutoRepository>(
                builder: (context, produtos, child) {
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: List.generate(produtos.lista.length, (index) {
                      return InkWell(
                        onTap: () => mostrarProduto(produtos.lista[index]),
                        child: Card(
                          elevation: 3,
                          semanticContainer: true,
                          margin: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset(
                                  produtos.lista[index].foto,
                                  height: 100,
                                  width: 150,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  produtos.lista[index].nome,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                child: Text(
                                  'R\$ ${produtos.lista[index].valor}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
