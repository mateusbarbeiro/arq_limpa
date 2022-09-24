import '../dto/certificado_dto.dart';
import './atividade.dart';

class Certificado {
  late int? id;
  late String titulo;
  late String descricao;
  late DateTime dataEmissao;
  late double quantidadeHoras;
  late double? quantidadeHorasValidadas;
  late bool validado;
  late Atividade atividade;
  late String? urlImagem;

  Certificado({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.dataEmissao,
    required this.quantidadeHoras,
    this.quantidadeHorasValidadas = 0,
    this.validado = false,
    required this.atividade,
    this.urlImagem,
  });

  Certificado.criar(CertificadoCriarDto dto, Atividade atividade) {
    titulo = dto.titulo;
    descricao = dto.descricao;
    dataEmissao = dto.dataEmissao;
    quantidadeHoras = dto.quantidadeHoras;
    quantidadeHorasValidadas = dto.quantidadeHorasValidadas;
    validado = dto.validado;
    urlImagem = dto.urlImagem;
    atividade = atividade;
  }

  void validaHoras() {
    if (quantidadeHoras == 0) {
      throw Exception('Deveria ser inserido a quantidade de horas');
    }

    if (validado && quantidadeHorasValidadas == null ||
        quantidadeHorasValidadas == 0) {
      throw Exception('Deveria ser inserido a quantidade de horas validadas');
    }
  }
}
