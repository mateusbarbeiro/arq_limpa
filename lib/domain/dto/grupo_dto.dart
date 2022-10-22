class GrupoCriarDto {
  String nome;
  String descricao;
  int horasObrigatorias;
  List<int>? atividadeIds;

  GrupoCriarDto({
    required this.nome,
    required this.descricao,
    required this.horasObrigatorias,
    this.atividadeIds,
  });
}

class GrupoAtualizarDto extends GrupoCriarDto {
  late int id;

  GrupoAtualizarDto({
    required super.nome,
    required super.descricao,
    required super.horasObrigatorias,
    super.atividadeIds,
    required this.id,
  });
}

class GrupoDto extends GrupoAtualizarDto {
  GrupoDto({
    required super.nome,
    required super.descricao,
    required super.horasObrigatorias,
    required super.id,
  });
}
