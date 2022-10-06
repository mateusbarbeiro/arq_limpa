import 'package:arq_limpa/aplicacao/views/certificado/certificado_form_page.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_certificado_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CertificadoController {
  final formKey = GlobalKey<FormState>();
  final ICerificadoDao _service = GetIt.I.get<ICerificadoDao>();

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataEmissaoController = TextEditingController();
  final quantHorasController = TextEditingController();
  final quantHorasValidadasController = TextEditingController();
  final certificadoValidadoController = TextEditingController();
  final urlImagemController = TextEditingController();
  bool status = false;
  String? grupo;
  List<String> grupos = [
    "Grupo 1",
    "Grupo 2",
    "Grupo 3",
  ];

  Future<List<CertificadoDto>> get allCertificados async {
    return _service.getAll();
  }

  Future goToForm(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CertificadoFormPage(),
      ),
    );
  }

  void insertCertificado(BuildContext context) {
    CertificadoCriarDto certificado = CertificadoCriarDto(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      dataEmissao: DateTime.parse(dataEmissaoController.text),
      quantidadeHoras: double.parse(quantHorasController.text),
      atividadeId: 1,
      urlImagem: "",
    );

    _service.insert(certificado);
    Navigator.pop(context);
  }

  Future<CertificadoDto> getById(int id) async {
    return await _service.getById(id);
  }
}
