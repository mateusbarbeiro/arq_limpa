import '../dto/certificado_dto.dart';
import './atividade.dart';

class Certificado {
  late int? id;
  late String titulo;
  late String descricao;
  late DateTime dataEmissao;
  late double quantidadeHoras;
  late double quantidadeHorasValidadas;
  late bool verificado;
  late Atividade atividade;
  late String? urlImagem;

  Certificado({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.dataEmissao,
    required this.quantidadeHoras,
    this.quantidadeHorasValidadas = 0,
    this.verificado = false,
    required this.atividade,
    this.urlImagem,
  });

  Certificado.criar(CertificadoCriarDto dto, Atividade atividade) {
    titulo = dto.titulo;
    descricao = dto.descricao;
    dataEmissao = dto.dataEmissao;
    quantidadeHoras = dto.quantidadeHoras;
    urlImagem = dto.urlImagem;
    atividade = atividade;
    verificado = false;
  }

  void validarQuantidadeHoras() {
    quantidadeHoras == 0
        ? throw Exception('Deve ser informado quantidade de horas')
        : null;

    quantidadeHoras < 0
        ? throw Exception('Quantidade de horas não podem ser negativas')
        : null;
  }

  void validarQuantidadeHorasValidadas() {
    if (quantidadeHorasValidadas == 0) {
      throw Exception('Deve ser informado quantidade de horas');
    }
    if (quantidadeHorasValidadas < 0) {
      throw Exception('Quantidade de horas não podem ser negativas');
    }
  }

  void validarHorasValidadasCertificadoVerificado() {
    if (verificado && quantidadeHorasValidadas <= 0) {
      throw Exception('Deveria ser inserido a quantidade de horas validadas');
    }
  }

  void verificaCertificado() {
    verificado = true;
    quantidadeHorasValidadas = _calculaHorasValidadas;
  }

  double get _calculaHorasValidadas {
    return quantidadeHoras * (atividade.equivalencia / 100);
  }
}
