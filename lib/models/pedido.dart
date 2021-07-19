import 'package:flutter/foundation.dart';

import 'package:easy/models/produto.dart';

class Pedido {
  int numeroPedido;
  String dataPedido;
  double valorTotal;
  List<Produto> produtos;
  String dataEntrega;

  Pedido({
    required this.numeroPedido,
    required this.dataPedido,
    required this.valorTotal,
    required this.produtos,
    required this.dataEntrega,
  });

  Pedido copyWith({
    int? numeroPedido,
    String? dataPedido,
    double? valorTotal,
    List<Produto>? produtos,
    String? dataEntrega,
  }) {
    return Pedido(
      numeroPedido: numeroPedido ?? this.numeroPedido,
      dataPedido: dataPedido ?? this.dataPedido,
      valorTotal: valorTotal ?? this.valorTotal,
      produtos: produtos ?? this.produtos,
      dataEntrega: dataEntrega ?? this.dataEntrega,
    );
  }

  @override
  String toString() {
    return 'Pedido(numeroPedido: $numeroPedido, dataPedido: $dataPedido, valorTotal: $valorTotal, produtos: $produtos, dataEntrega: $dataEntrega)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pedido &&
        other.numeroPedido == numeroPedido &&
        other.dataPedido == dataPedido &&
        other.valorTotal == valorTotal &&
        listEquals(other.produtos, produtos) &&
        other.dataEntrega == dataEntrega;
  }

  @override
  int get hashCode {
    return numeroPedido.hashCode ^
        dataPedido.hashCode ^
        valorTotal.hashCode ^
        produtos.hashCode ^
        dataEntrega.hashCode;
  }
}
