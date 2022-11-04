import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/caso_de_uso/atividade_caso.dart';
import '../../../../domain/dto/atividade_dto.dart';
import '../../../../domain/interfaces/dao/i_atividade_dao.dart';

class AtividadeController {
  final formKey = GlobalKey<FormState>();
  final AtividadeCaso caso = AtividadeCaso();

  Future<List<AtividadeDto>> get allAtividades async {
    return caso.buscarTodos();
  }

  Future<List<AtividadeDto>> atividadesDoGrupo(id) async {
    return caso.atividadesDoGrupo(id);
  }
}
