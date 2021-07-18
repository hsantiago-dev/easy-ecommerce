import 'dart:convert';

class CartaoModel {
  final String? numeroCartao;
  final String? nomeTitular;
  final String? vencimento;
  final String? codigoSeguranca;

  CartaoModel({
    this.numeroCartao,
    this.nomeTitular,
    this.vencimento,
    this.codigoSeguranca,
  });

  CartaoModel copyWith({
    String? numeroCartao,
    String? nomeTitular,
    String? vencimento,
    String? codigoSeguranca,
  }) {
    return CartaoModel(
      numeroCartao: numeroCartao ?? this.numeroCartao,
      nomeTitular: nomeTitular ?? this.nomeTitular,
      vencimento: vencimento ?? this.vencimento,
      codigoSeguranca: codigoSeguranca ?? this.codigoSeguranca,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numeroCartao': numeroCartao,
      'nomeTitular': nomeTitular,
      'vencimento': vencimento,
      'codigoSeguranca': codigoSeguranca,
    };
  }

  factory CartaoModel.fromMap(Map<String, dynamic> map) {
    return CartaoModel(
      numeroCartao: map['numeroCartao'],
      nomeTitular: map['nomeTitular'],
      vencimento: map['vencimento'],
      codigoSeguranca: map['codigoSeguranca'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartaoModel.fromJson(String source) =>
      CartaoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartaoModel(numeroCartao: $numeroCartao, nomeTitular: $nomeTitular, vencimento: $vencimento, codigoSeguranca: $codigoSeguranca)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartaoModel &&
        other.numeroCartao == numeroCartao &&
        other.nomeTitular == nomeTitular &&
        other.vencimento == vencimento &&
        other.codigoSeguranca == codigoSeguranca;
  }

  @override
  int get hashCode {
    return numeroCartao.hashCode ^
        nomeTitular.hashCode ^
        vencimento.hashCode ^
        codigoSeguranca.hashCode;
  }
}
