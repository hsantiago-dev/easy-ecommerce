import 'dart:convert';

class Usuario {
  String nome;
  String fotoUrl;
  String email;
  String? cpf;
  String? celular;

  Usuario({
    required this.nome,
    required this.fotoUrl,
    this.cpf,
    this.celular,
    required this.email,
  });

  Usuario copyWith({
    String? nome,
    String? fotoUrl,
    String? cpf,
    String? celular,
    String? email,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      cpf: cpf ?? this.cpf,
      celular: celular ?? this.celular,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'fotoUrl': fotoUrl,
      'cpf': cpf,
      'celular': celular,
      'email': email,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'],
      fotoUrl: map['fotoUrl'],
      cpf: map['cpf'],
      celular: map['celular'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(nome: $nome, fotoUrl: $fotoUrl, cpf: $cpf, celular: $celular, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario &&
        other.nome == nome &&
        other.fotoUrl == fotoUrl &&
        other.cpf == cpf &&
        other.celular == celular &&
        other.email == email;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        fotoUrl.hashCode ^
        cpf.hashCode ^
        celular.hashCode ^
        email.hashCode;
  }
}
