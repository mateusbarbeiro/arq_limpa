import '../../dto/atividade_dto.dart';

abstract class IAtividadeDao {
  Future insert(AtividadeCriarDto object);

  Future update(AtividadeAtualizarDto object);

  Future deleteById(int id);

  Future<AtividadeDto> getById(int id);

  Future<List<AtividadeDto>> getAll();

  Future<List<AtividadeDto>> getByGrupoId(int id);
}
