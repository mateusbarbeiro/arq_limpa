import 'package:arq_limpa/aplicacao/views/certificado/certificado_form_page.dart';
import 'package:arq_limpa/domain/caso_de_uso/grupo_caso.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_certificado_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/dto/grupo_dto.dart';
import '../../../../domain/interfaces/dao/i_grupo_dao.dart';

class GrupoController {
  final formKey = GlobalKey<FormState>();
  final GrupoCaso caso = GrupoCaso();

  Future<List<GrupoDto>> get allGrupos async {
    return caso.buscarTodos();
  }
}
