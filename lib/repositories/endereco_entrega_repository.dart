import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy/db/db_firestore.dart';
import 'package:easy/models/endereco.dart';
import 'package:easy/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class EnderecoEntregaRepository extends ChangeNotifier {
  List<Endereco> _lista = [];
  late FirebaseFirestore db;
  AuthService auth;

  UnmodifiableListView<Endereco> get lista => UnmodifiableListView(_lista);

  EnderecoEntregaRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _carrregarEnderecos();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _carrregarEnderecos() async {
    final doc = await db.collection('usuarios').doc(auth.usuario!.uid).get();

    doc.get('enderecos').forEach((endereco_doc) {
      Endereco endereco = Endereco(
        cep: endereco_doc['cep'],
        logradouro: endereco_doc['logradouro'],
        numero: endereco_doc['numero'],
        bairro: endereco_doc['bairro'],
        cidade: endereco_doc['cidade'],
      );

      _lista.add(endereco);
    });

    notifyListeners();
  }

  salvarEnderecosEntrega(Endereco endereco) async {
    _lista.add(endereco);

    List<Map<String, dynamic>> enderecosJson = [];

    _lista.forEach((endereco) {
      enderecosJson.add(endereco.toMap());
    });

    Map<String, dynamic> listaJson = {"enderecos": enderecosJson};

    await db.collection('usuarios').doc(auth.usuario!.uid).update(listaJson);

    notifyListeners();
  }

  removerEndereco(Endereco endereco) async {
    _lista.remove(endereco);

    List<Map<String, dynamic>> enderecosJson = [];

    _lista.forEach((endereco) {
      enderecosJson.add(endereco.toMap());
    });

    Map<String, dynamic> listaJson = {"enderecos": enderecosJson};

    await db.collection('usuarios').doc(auth.usuario!.uid).update(listaJson);

    notifyListeners();
  }
}
