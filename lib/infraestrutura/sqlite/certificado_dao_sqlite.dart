import 'package:sqflite/sqflite.dart';
import '../../domain/dto/certificado_dto.dart';
import '../../domain/interfaces/dao/i_certificado_dao.dart';
import 'conexao.dart';

class CertificadoDaoSqlite extends ICertificadoDao {
  late Database _db;

  @override
  Future deleteById(int id) async {
    _db = await Conexao.get();

    var sql = "DELETE FROM certificados WHERE id = ?";
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<List<CertificadoDto>> getAll() async {
    _db = await Conexao.get();

    List<Map<String, dynamic>> resultado = await _db.query("certificados");
    List<CertificadoDto> certificados = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return CertificadoDto(
        id: linha['id'],
        titulo: linha['titulo'],
        dataEmissao: linha['dataEmissao'],
        descricao: linha['descricao'],
        atividadeId: linha['atividade_id'] as int,
        quantidadeHoras: double.parse(linha['quantidadeHoras']),
        horasValidadas: double.parse(linha['quantidadeHorasValidadas']),
        verificado: linha['verificado'] as bool,
        urlImagem: linha['urlImagem'],
      );
    });

    return certificados;
  }

  @override
  Future<CertificadoDto> getById(int id) async {
    _db = await Conexao.get();

    var sql = "SELECT * FROM certificados WHERE id = ?";
    Map<String, dynamic> linha = (await _db.rawQuery(sql, [id])).first;

    var certificado = CertificadoDto(
      id: linha['id'],
      titulo: linha['titulo'],
      dataEmissao: linha['dataEmissao'],
      descricao: linha['descricao'],
      atividadeId: linha['atividade_id'] as int,
      quantidadeHoras: double.parse(linha['quantidadeHoras']),
      horasValidadas: double.parse(linha['quantidadeHorasValidadas']),
      verificado: linha['verificado'] as bool,
      urlImagem: linha['urlImagem'],
    );

    return certificado;
  }

  @override
  Future insert(CertificadoCriarDto object) async {
    _db = await Conexao.get();

    // if (object.id != null) {
    //   throw Exception();
    // }

    var sql = '''INSERT INTO certificados (titulo, dataEmissao, descricao, 
      atividade_id, quantidadeHoras, 
      verificado, urlImage) VALUES (?, ?, ?, ?, ?, ?, ?)''';
    await _db.rawInsert(sql, [
      object.titulo,
      object.dataEmissao,
      object.descricao,
      object.atividadeId,
      object.quantidadeHoras,
      false,
      object.urlImagem,
    ]);
  }

  @override
  Future update(CertificadoAtualizarDto object) async {
    _db = await Conexao.get();

    var sql = '''UPDATE certificados 
    SET titulo = ?,
    descricao = ?,
    dataEmissao = ?,
    quantidadeHoras = ?,
    atividade_id = ?,
    urlImage = ? 
    WHERE id = ?''';
    await _db.rawUpdate(sql, [
      object.titulo,
      object.descricao,
      object.dataEmissao.toString(),
      object.quantidadeHoras,
      object.atividadeId,
      object.urlImagem,
      object.id,
    ]);
  }

  @override
  Future updateSomeFields(Map<String, dynamic> updated) {
    // TODO: implement updateSomeFields
    throw UnimplementedError();
  }
}
