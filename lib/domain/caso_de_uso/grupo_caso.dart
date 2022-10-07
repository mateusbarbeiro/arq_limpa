import 'package:arq_limpa/domain/dto/grupo_dto.dart';
import 'package:get_it/get_it.dart';

import '../interfaces/dao/i_grupo_dao.dart';

class GrupoCaso {
  late IGrupoDao grupoDao = GetIt.I.get<IGrupoDao>();

  Future<bool> criar(GrupoCriarDto criarDto) async {
    try {
      await grupoDao.insert(criarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> atualizar(GrupoAtualizarDto atualizarDto) async {
    try {
      await grupoDao.update(atualizarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> excluir(int id) async {
    try {
      await grupoDao.deleteById(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<GrupoDto?> buscarPorId(int id) async {
    try {
      GrupoDto grupo = await grupoDao.getById(id);
      return grupo;
    } catch (e) {
      return null;
    }
  }

  Future<List<GrupoDto>> buscarTodos() async {
    try {
      List<GrupoDto> grupo = await grupoDao.getAll();
      return grupo;
    } catch (e) {
      return [];
    }
  }
}
