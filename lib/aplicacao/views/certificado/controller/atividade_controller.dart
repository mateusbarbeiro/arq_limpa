import 'package:arq_limpa/aplicacao/views/certificado/certificado_form_page.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_certificado_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/dto/atividade_dto.dart';
import '../../../../domain/dto/grupo_dto.dart';
import '../../../../domain/interfaces/dao/i_atividade_dao.dart';
import '../../../../domain/interfaces/dao/i_grupo_dao.dart';

class AtividadeController {
  final formKey = GlobalKey<FormState>();
  final IAtividadeDao _service = GetIt.I.get<IAtividadeDao>();

  Future<List<AtividadeDto>> get allAtividades async {
    return _service.getAll();
  }

  Future<List<AtividadeDto>> atividadesDoGrupo(int id) async {
    return await _service.getByGrupoId(id);
  }
}
