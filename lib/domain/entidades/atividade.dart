class Atividade {
  int? id;
  String nome;
  int maximoHoras;
  int equivalencia; // porcentagem

  Atividade({
    this.id,
    required this.nome,
    required this.maximoHoras,
    required this.equivalencia,
  });
}
