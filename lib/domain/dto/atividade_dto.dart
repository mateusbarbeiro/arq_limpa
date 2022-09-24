class AtividadeCriarDto {
  String nome;
  int maximoHoras;
  int equivalencia; // porcentagem
  int grupoId;

  AtividadeCriarDto({
    required this.nome,
    required this.maximoHoras,
    required this.equivalencia,
    required this.grupoId,
  });
}

class AtividadeAtualizarDto extends AtividadeCriarDto {
  int id;

  AtividadeAtualizarDto({
    required this.id,
    required super.nome,
    required super.maximoHoras,
    required super.equivalencia,
    required super.grupoId,
  });
}
