import '../dto/certificado_dto.dart';
import './atividade.dart';

class Certificado {
  late int? id;
  late String titulo;
  late String descricao;
  late String dataEmissao;
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

  Certificado validarQuantidadeHoras() {
    quantidadeHoras == 0
        ? throw Exception('Deve ser informado quantidade de horas')
        : null;

    quantidadeHoras < 0
        ? throw Exception('Quantidade de horas não podem ser negativas')
        : null;
    return this;
  }

  Certificado validarQuantidadeHorasValidadas() {
    if (quantidadeHorasValidadas == 0) {
      throw Exception('Deve ser informado quantidade de horas');
    }
    if (quantidadeHorasValidadas < 0) {
      throw Exception('Quantidade de horas não podem ser negativas');
    }
    return this;
  }

  Certificado validarHorasValidadasCertificadoVerificado() {
    if (verificado && quantidadeHorasValidadas <= 0) {
      throw Exception('Deveria ser inserido a quantidade de horas validadas');
    }

    return this;
  }

  Certificado verificaHorasCertificado() {
    verificado = true;
    quantidadeHorasValidadas = _calculaHorasValidadas;

    return this;
  }

  double get _calculaHorasValidadas {
    return quantidadeHoras * (atividade.equivalencia / 100);
  }

  Certificado validarSePodeAtualizar() {
    if (verificado) {
      throw Exception(
        'Certificado não pode ser atualizado pois já se encontra validado.',
      );
    }
    return this;
  }

  Certificado validarSePodeExcluir() {
    if (verificado) {
      throw Exception(
        'Certificado não pode ser excluído pois já se encontra validado.',
      );
    }
    return this;
  }

  //TODO - VALIDAR COM MATHEUS
  CertificadoDto toDto() {
    return CertificadoDto(
      id: id!,
      titulo: titulo,
      descricao: descricao,
      dataEmissao: dataEmissao,
      quantidadeHoras: quantidadeHoras,
      verificado: verificado,
      atividadeId: atividade.id!,
      urlImagem: urlImagem!,
      horasValidadas: quantidadeHorasValidadas,
    );
  }
}
