import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy/db/db_firestore.dart';
import 'package:easy/models/produto.dart';
import 'package:flutter/cupertino.dart';

class ProdutoRepository extends ChangeNotifier {
  List<Produto> _lista = [];
  late FirebaseFirestore db;

  UnmodifiableListView<Produto> get lista => UnmodifiableListView(_lista);

  ProdutoRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readProdutos();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readProdutos() async {
    if (_lista.isEmpty) {
      await db.collection('produtos').get().then((querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              _lista.add(
                Produto(
                  foto: doc.data()['foto'],
                  nome: doc.data()['nome'],
                  valor: double.parse(doc.data()['valor'].toString()),
                  descricao: doc.data()['descricao'],
                ),
              );
            })
          });

      notifyListeners();
    }
  }
}
