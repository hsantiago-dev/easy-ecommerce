import 'package:easy/models/pedido.dart';
import 'package:easy/models/produto.dart';

class PedidosRepository {
  static List<Pedido> pedidos = [
    Pedido(
      numeroPedido: 1235487,
      dataPedido: '18/07/2021',
      valorTotal: 4199.98,
      produtos: [
        Produto(
          foto: 'assets/images/notebookAcer.jpg',
          valor: 2499.99,
          nome: 'Notebook Acer',
          descricao: 'Notebook bom pra caramba.',
        ),
        Produto(
          foto: 'assets/images/galaxyS10.jpg',
          valor: 3599.99,
          nome: 'Samsung Galaxy S10',
          descricao: 'Celular bom pra caramba.',
        ),
        Produto(
          foto: 'assets/images/alexa.jpg',
          valor: 599.99,
          nome: 'Echo Dot Alexa',
          descricao: 'Alexa boa pra caramba.',
        ),
        Produto(
          foto: 'assets/images/roteador.jpg',
          valor: 99.99,
          nome: 'Roteador Wireless Multilaser',
          descricao: 'Roteador bom pra caramba.',
        ),
      ],
      dataEntrega: '21/07/2021',
    ),
    Pedido(
      numeroPedido: 50327890,
      dataPedido: '18/07/2021',
      valorTotal: 349.99,
      produtos: [
        Produto(
          foto: 'assets/images/headsetGato.jpg',
          valor: 349.99,
          nome: 'Headset Gamer Orelha de Gato',
          descricao: 'Headset bom e bonito pra caramba.',
        ),
      ],
      dataEntrega: '21/07/2021',
    ),
  ];
}
