import 'package:easy/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdutoPage extends StatelessWidget {
  final Produto produto;
  const ProdutoPage({
    Key? key,
    required this.produto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detalhes do produto',
            style: GoogleFonts.inter(
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    produto.foto,
                    width: 400,
                    height: 270,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Text(
                    produto.nome,
                    style: GoogleFonts.lexendDeca(
                        fontSize: 24, color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Descrição: ${produto.descricao}',
                    style:
                        GoogleFonts.inter(fontSize: 18, color: Colors.black87),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Divider(height: 10, color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'R\$: ${produto.valor}',
                    style: GoogleFonts.lexendDeca(
                        fontSize: 34, color: Color(0xFF28D890)),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                    onPressed: () {},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'COMPRAR',
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF1a72c9), Color(0xFF1abec4)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'ADICIONAR AO CARRINHO',
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
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
