import 'package:sqflite/sqflite.dart';
import '../../domain/dto/atividade_dto.dart';
import '../../domain/interfaces/dao/i_atividade_dao.dart';
import 'conexao.dart';

class AtividadeDaoSqlite extends IAtividadeDao {
  late Database _db;

  @override
  Future deleteById(int id) async {
    _db = await Conexao.get();

    var sql = "DELETE FROM atividade WHERE id = ?";
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<List<AtividadeDto>> getAll() async {
    _db = await Conexao.get();

    List<Map<String, dynamic>> resultado = await _db.query("atividade");
    List<AtividadeDto> atividades = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return AtividadeDto(
        id: linha['id'],
        equivalencia: linha['equivalencia'],
        grupoId: linha['grupoId'] as int,
        maximoHoras: linha['maximoHoras'] as int,
        nome: linha['nome'],
      );
    });

    return atividades;
  }

  @override
  Future<AtividadeDto> getById(int id) async {
    _db = await Conexao.get();

    var sql = "SELECT * FROM atividade WHERE id = ?";
    Map<String, dynamic> linha = (await _db.rawQuery(sql, [id])).first;

    var atividade = AtividadeDto(
      id: linha['id'],
      equivalencia: linha['equivalencia'],
      grupoId: linha['grupoId'] as int,
      maximoHoras: linha['maximoHoras'] as int,
      nome: linha['nome'],
    );

    return atividade;
  }

  @override
  Future insert(AtividadeCriarDto object) async {
    _db = await Conexao.get();

    var sql = '''INSERT INTO atividade (nome, maximoHoras, equivalencia, 
      grupoId) VALUES (?, ?, ?, ?)''';
    await _db.rawInsert(sql, [
      object.nome,
      object.maximoHoras,
      object.equivalencia,
      object.grupoId,
    ]);
  }

  @override
  Future update(AtividadeAtualizarDto object) async {
    _db = await Conexao.get();

    var sql = '''UPDATE atividade 
    SET nome = ?,
    maximoHoras = ?,
    equivalencia = ?,
    grupoId = ? 
    WHERE id = ?''';
    await _db.rawUpdate(sql, [
      object.nome,
      object.maximoHoras,
      object.equivalencia,
      object.grupoId,
      object.id,
    ]);
  }
}
