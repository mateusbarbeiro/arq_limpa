import 'package:arq_limpa/domain/dto/grupo_dto.dart';

abstract class IGrupoDao {
  Future insert(GrupoCriarDto object);

  Future update(GrupoAtualizarDto object);

  Future deleteById(int id);

  Future<GrupoDto> getById(int id);

  Future<List<GrupoDto>> getAll();
}
