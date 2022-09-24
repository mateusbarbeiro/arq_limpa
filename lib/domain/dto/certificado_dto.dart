class CertificadoCriarDto {
  String titulo;
  String descricao;
  DateTime dataEmissao;
  double quantidadeHoras;
  double quantidadeHorasValidadas;
  bool validado;
  int grupoId;
  String urlImagem;

  CertificadoCriarDto({
    required this.titulo,
    required this.descricao,
    required this.dataEmissao,
    this.quantidadeHoras = 0,
    this.quantidadeHorasValidadas = 0,
    this.validado = false,
    required this.grupoId,
    required this.urlImagem,
  });
}

class CertificadoAtualizarDto extends CertificadoCriarDto {
  int id;

  CertificadoAtualizarDto({
    required this.id,
    required super.titulo,
    required super.descricao,
    required super.dataEmissao,
    super.quantidadeHoras,
    super.quantidadeHorasValidadas = 0,
    super.validado,
    required super.grupoId,
    required super.urlImagem,
  });
}

class CertificadoDto extends CertificadoAtualizarDto {
  CertificadoDto({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.dataEmissao,
    required super.grupoId,
    required super.urlImagem,
  });
}
