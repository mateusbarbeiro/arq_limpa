import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/entidades/atividade.dart';
import 'package:arq_limpa/domain/entidades/certificado.dart';

import '../interfaces/caso_uso/i_certificado_caso.dart';
import '../interfaces/dao/i_certificado_dao.dart';

class CertificadoCaso extends ICerificadoCaso {
  late ICerificadoDao cerificadoDao; // todo: implementar interface

  Future criarCerticado(CertificadoCriarDto criarDto) async {
    Certificado certificado = Certificado.criar(
        criarDto, Atividade(nome: 'nome', maximoHoras: 10, equivalencia: 100));
  }
}
