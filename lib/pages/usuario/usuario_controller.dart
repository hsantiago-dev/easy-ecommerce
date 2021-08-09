import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy/db/db_firestore.dart';
import 'package:easy/models/usuario.dart';
import 'package:easy/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class UsuarioController extends ChangeNotifier {
  late Usuario usuario;
  late FirebaseFirestore db;
  AuthService auth;

  UsuarioController({required this.auth}) {
    usuario = usuario = Usuario(
      nome: auth.usuario!.displayName!,
      fotoUrl: auth.usuario!.photoURL!,
      email: auth.usuario!.email!,
      celular: '',
      cpf: '',
    );
    _startController();
  }

  _startController() async {
    await _startFirestore();
    await _carregarDadosUsuario();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _carregarDadosUsuario() async {
    await db.collection('usuarios').doc(auth.usuario!.uid).get().then((doc) => {
          if (doc.data()!.keys.contains('cpf')) usuario.cpf = doc.get('cpf'),
          if (doc.data()!.keys.contains('celular'))
            usuario.celular = doc.get('celular'),
        });
    notifyListeners();
  }

  _setUsuario() async {
    await db.collection('usuarios').doc(auth.usuario!.uid).set({
      'uid': auth.usuario!.uid,
      'nome': usuario.nome,
      'email': usuario.email,
      'fotoUrl': usuario.fotoUrl,
      'cpf': usuario.cpf,
      'celular': usuario.celular,
    });

    notifyListeners();
  }

  void onChange({
    String? nome,
    String? fotoUrl,
    String? cpf,
    String? celular,
    String? email,
  }) {
    usuario = usuario.copyWith(
      nome: nome,
      fotoUrl: fotoUrl,
      cpf: cpf,
      celular: celular,
      email: email,
    );
    _setUsuario();
  }
}
