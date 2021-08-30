import 'dart:convert';

class Endereco {
  String cep;
  String logradouro;
  String numero;
  String bairro;
  String cidade;

  Endereco({
    required this.cep,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.cidade,
  });

  Endereco copyWith({
    String? cep,
    String? logradouro,
    String? numero,
    String? bairro,
    String? cidade,
  }) {
    return Endereco(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      cep: map['cep'],
      logradouro: map['logradouro'],
      numero: map['numero'],
      bairro: map['bairro'],
      cidade: map['cidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(cep: $cep, logradouro: $logradouro, numero: $numero, bairro: $bairro, cidade: $cidade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Endereco &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.cidade == cidade;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        cidade.hashCode;
  }
}
