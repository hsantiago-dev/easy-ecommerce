import 'package:easy/models/cartao.dart';
import 'package:flutter/material.dart';

class CartaoController {
  final formKey = GlobalKey<FormState>();
  CartaoModel model = CartaoModel();

  String? validarNumeroCartao(String? value) =>
      value?.isEmpty ?? true ? 'o número do cartão não pode ser vazio' : null;
  String? validarNomeTitular(String? value) =>
      value?.isEmpty ?? true ? 'o nome do titular não pode ser vazio' : null;
  String? validarVencimento(String? value) =>
      value?.isEmpty ?? true ? 'o vencimento não pode ser vazio' : null;
  String? validarCodigoSeguranca(String? value) => value?.isEmpty ?? true
      ? 'o código de segurança não pode ser vazio'
      : null;

  void onChange({
    String? numeroCartao,
    String? nomeTitular,
    String? vencimento,
    String? codigoSeguranca,
  }) {
    model = model.copyWith(
      numeroCartao: numeroCartao,
      nomeTitular: nomeTitular,
      vencimento: vencimento,
      codigoSeguranca: codigoSeguranca,
    );
  }
}
