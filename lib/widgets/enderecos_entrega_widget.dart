import 'package:easy/repositories/carrinho_repository.dart';
import 'package:easy/repositories/endereco_entrega_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnderecosEntregaWidget extends StatelessWidget {
  final bool selecionavel;
  EnderecosEntregaWidget({Key? key, this.selecionavel = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Endereços para entrega',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/formulario_endereco');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFF28D890),
                    size: 34,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Consumer<EnderecoEntregaRepository>(
              builder: (context, enderecos, child) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            enderecos.lista[index].logradouro,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(enderecos.lista[index].numero),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    '${enderecos.lista[index].cep}, ${enderecos.lista[index].bairro}, ${enderecos.lista[index].cidade}'),
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            if (selecionavel) {
                              context
                                  .read<CarrinhoRepository>()
                                  .setEnderecoEntrega(enderecos.lista[index]);

                              Navigator.pop(context);
                            } else {
                              enderecos.removerEndereco(enderecos.lista[index]);
                            }
                          },
                          icon: (selecionavel)
                              ? const Icon(
                                  Icons.navigate_next,
                                  size: 25,
                                )
                              : const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, ___) => const Divider(),
                  itemCount: enderecos.lista.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
