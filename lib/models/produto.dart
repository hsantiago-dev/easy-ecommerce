class Produto {
  String foto;
  String nome;
  double valor;
  String? descricao;
  int? quantidade;

  Produto({
    required this.foto,
    required this.nome,
    required this.valor,
    this.descricao,
  });
}
