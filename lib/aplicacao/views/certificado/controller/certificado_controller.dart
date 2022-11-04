import 'package:arq_limpa/aplicacao/views/certificado/certificado_form_page.dart';
import 'package:arq_limpa/domain/caso_de_uso/certificado_caso.dart';
import 'package:arq_limpa/domain/dto/atividade_dto.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/dto/grupo_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CertificadoController {
  final formKey = GlobalKey<FormState>();
  final CertificadoCaso caso = CertificadoCaso();

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataEmissaoController = TextEditingController();
  final quantHorasController = TextEditingController();
  final quantHorasValidadasController = TextEditingController();
  final certificadoValidadoController = TextEditingController();
  final urlImagemController = TextEditingController();
  bool status = false;
  GrupoDto? grupo;
  AtividadeDto? atividade;

  Future<List<CertificadoDto>> get allCertificados async {
    return caso.buscarTodos();
  }

  Future goToForm(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CertificadoFormPage(),
      ),
    );
  }

  Future insertCertificado(BuildContext context) async {
    if (atividade == null) return;

    CertificadoCriarDto certificado = CertificadoCriarDto(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      dataEmissao: dataEmissaoController.text,
      quantidadeHoras: double.parse(quantHorasController.text),
      atividadeId: atividade!.id,
      urlImagem: urlImagemController.text,
    );

    await caso.criar(certificado);
    Navigator.pop(context);
  }

  Future<CertificadoDto?> getById(int id) async {
    return await caso.buscarPorId(id);
  }
}
