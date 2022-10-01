import '../dto/atividade_dto.dart';
import '../entidades/atividade.dart';
import '../interfaces/dao/i_atividade_dao.dart';

class AtividadeCaso {
  late IAtividadeDao atividadeDao;

  Future<bool> criar(AtividadeCriarDto criarDto) async {
    try {
      await atividadeDao.insert(criarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> atualizar(AtividadeAtualizarDto atualizarDto) async {
    try {
      await atividadeDao.update(atualizarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> excluir(int id) async {
    try {
      await atividadeDao.deleteById(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AtividadeDto?> buscarPorId(int id) async {
    try {
      AtividadeDto atividade = await atividadeDao.getById(id);
      return atividade;
    } catch (e) {
      return null;
    }
  }

  Future<List<AtividadeDto>> buscarTodos() async {
    try {
      List<AtividadeDto> atividade = await atividadeDao.getAll();
      return atividade;
    } catch (e) {
      return [];
    }
  }

  Future<Atividade> buscaAtividadePorId(int id) async {
    AtividadeDto atividadeDto = await atividadeDao.getById(
      id,
    );
    Atividade atividade = Atividade.fromDto(
      atividadeDto,
    );
    return atividade;
  }
}
