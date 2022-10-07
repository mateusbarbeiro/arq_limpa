import 'package:flutter/foundation.dart';

class CertificadoCriarDto {
  String titulo;
  String descricao;
  DateTime dataEmissao;
  double quantidadeHoras;
  int atividadeId;
  String urlImagem;

  CertificadoCriarDto({
    required this.titulo,
    required this.descricao,
    required this.dataEmissao,
    this.quantidadeHoras = 0,
    required this.atividadeId,
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
    required super.quantidadeHoras,
    required super.atividadeId,
    required super.urlImagem,
  });
}

class CertificadoDto extends CertificadoAtualizarDto {
  CertificadoDto({
    required super.id,
    required super.titulo,
    required super.descricao,
    required super.dataEmissao,
    required super.atividadeId,
    required super.urlImagem,
    required this.horasValidadas,
    required this.verificado,
    required super.quantidadeHoras,
  });

  bool verificado;
  double horasValidadas;
}
