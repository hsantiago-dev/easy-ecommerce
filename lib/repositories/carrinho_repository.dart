import 'dart:collection';

import 'package:easy/models/endereco.dart';
import 'package:easy/models/produto.dart';
import 'package:flutter/material.dart';

class CarrinhoRepository extends ChangeNotifier {
  List<Produto> _lista = [];
  double total = 0;
  Endereco? endereco_entrega;

  UnmodifiableListView<Produto> get lista => UnmodifiableListView(_lista);

  setEnderecoEntrega(Endereco endereco) {
    endereco_entrega = endereco;
    notifyListeners();
  }

  add(Produto produto) {
    if (!_lista.contains(produto)) {
      produto.quantidade = 1;
      _lista.add(produto);
    }

    totalCarrinho();
    notifyListeners();
  }

  remove(Produto produto) {
    _lista.remove(produto);

    totalCarrinho();
    notifyListeners();
  }

  addQuantidade(Produto produto, quantidadeAtual) {
    _lista[_lista.indexOf(produto)].quantidade = quantidadeAtual + 1;

    totalCarrinho();
    notifyListeners();
  }

  removeQuantidade(Produto produto, quantidadeAtual) {
    _lista[_lista.indexOf(produto)].quantidade = quantidadeAtual - 1;

    if (_lista[_lista.indexOf(produto)].quantidade == 0) remove(produto);

    totalCarrinho();
    notifyListeners();
  }

  totalCarrinho() {
    total = 0.0;

    for (var i = 0; i < _lista.length; i++) {
      total += (_lista[i].quantidade! * _lista[i].valor);
    }

    notifyListeners();
  }

  limparCarrinho() {
    _lista = [];
    total = 0.0;
    notifyListeners();
  }
}
