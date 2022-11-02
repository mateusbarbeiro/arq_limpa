import 'package:sqflite/sqflite.dart';
import '../../domain/dto/grupo_dto.dart';
import '../../domain/interfaces/dao/i_grupo_dao.dart';
import 'conexao.dart';

class GrupoDaoSqlite extends IGrupoDao {
  late Database _db;

  @override
  Future deleteById(int id) async {
    _db = await Conexao.get();

    var sql = "DELETE FROM grupo WHERE id = ?";
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<List<GrupoDto>> getAll() async {
    _db = await Conexao.get();

    List<Map<String, dynamic>> resultado = await _db.query("grupo");
    List<GrupoDto> grupos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return GrupoDto(
          id: linha['id'],
          descricao: linha['descricao'],
          nome: linha['nome'],
          horasObrigatorias: linha['horasObrigatorias'] as int);
    });

    return grupos;
  }

  @override
  Future<GrupoDto> getById(int id) async {
    _db = await Conexao.get();

    var sql = "SELECT * FROM grupo WHERE id = ?";
    Map<String, dynamic> linha = (await _db.rawQuery(sql, [id])).first;

    var grupo = GrupoDto(
        id: linha['id'],
        descricao: linha['descricao'],
        nome: linha['nome'],
        horasObrigatorias: linha['horasObrigatorias'] as int);

    return grupo;
  }

  @override
  Future insert(GrupoCriarDto object) async {
    _db = await Conexao.get();

    // if (object.id != null) {
    //   throw Exception();
    // }

    var sql =
        '''INSERT INTO grupo (descricao, nome, horasObrigatorias) VALUES (?, ?, ?)''';
    await _db.rawInsert(sql, [
      object.descricao,
      object.nome,
      object.horasObrigatorias,
    ]);
  }

  @override
  Future update(GrupoAtualizarDto object) async {
    _db = await Conexao.get();

    var sql = '''UPDATE grupo 
    SET descricao = ?,
    nome = ?,
    horasObrigatorias = ?
    WHERE id = ?''';
    await _db.rawUpdate(sql, [
      object.nome,
      object.descricao,
      object.horasObrigatorias,
      object.id,
    ]);
  }

  @override
  Future updateSomeFields(Map<String, dynamic> updated) {
    // TODO: implement updateSomeFields
    throw UnimplementedError();
  }
}
