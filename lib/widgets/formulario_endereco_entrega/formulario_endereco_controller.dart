import 'dart:convert';

import 'package:easy/models/endereco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:http/http.dart' as http;

class FormularioEnderecoController {
  final formKey = GlobalKey<FormState>();
  final cepController = MaskedTextController(mask: '00000-000');
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  String? validarCep(String? value) {
    if (value!.length < 9) {
      return 'o CEP deve ter 8 dígitos';
    }

    return null;
  }

  String? validarLogradouro(String? value) {
    if (value!.isEmpty) {
      return 'Informe o endereço corretamente';
    }

    return null;
  }

  String? validarNumero(String? value) {
    if (value!.isEmpty) {
      return 'Informe o número corretamente';
    }

    return null;
  }

  String? validarBairro(String? value) {
    if (value!.isEmpty) {
      return 'Informe o bairro corretamente';
    }

    return null;
  }

  String? validarCidade(String? value) {
    if (value!.isEmpty) {
      return 'Informe a cidade corretamente';
    }

    return null;
  }

  String? validarEstado(String? value) {
    if (value!.isEmpty) {
      return 'Informe o estado corretamente';
    }

    return null;
  }

  buscaCepAPI() async {
    if (cepController.text.length == 9) {
      String uri =
          'https://viacep.com.br/ws/${cepController.text.replaceAll('-', '')}/json/';

      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        logradouroController.text = json['logradouro'];
        bairroController.text = json['bairro'];
        cidadeController.text = json['localidade'];
        estadoController.text = json['uf'];
      }
    }
  }

  retornarEndereco() {
    return Endereco(
      cep: cepController.text,
      logradouro: logradouroController.text,
      numero: numeroController.text,
      bairro: bairroController.text,
      cidade: estadoController.text,
    );
  }
}
