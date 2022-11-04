import 'package:sqflite/sqflite.dart';
import '../../domain/dto/certificado_dto.dart';
import '../../domain/interfaces/dao/i_certificado_dao.dart';
import 'conexao.dart';

class CertificadoDaoSqlite extends ICertificadoDao {
  late Database _db;

  @override
  Future deleteById(int id) async {
    _db = await Conexao.get();

    var sql = "DELETE FROM certificado WHERE id = ?";
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<List<CertificadoDto>> getAll() async {
    _db = await Conexao.get();

    List<Map<String, dynamic>> resultado = await _db.query("certificado");
    List<CertificadoDto> certificados = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return CertificadoDto(
        id: linha['id'],
        titulo: linha['titulo'],
        dataEmissao: linha['dataEmissao'],
        descricao: linha['descricao'],
        atividadeId: linha['atividadeId'] as int,
        quantidadeHoras: double.parse(linha['quantidadeHoras']),
        horasValidadas: double.parse(linha['quantidadeHorasValidadas'] ?? "0"),
        verificado: linha['verificado'] == 1,
        urlImagem: linha['urlImagem'] ?? '',
      );
    });

    return certificados;
  }

  @override
  Future<CertificadoDto> getById(int id) async {
    _db = await Conexao.get();

    var sql = "SELECT * FROM certificado WHERE id = ?";
    Map<String, dynamic> linha = (await _db.rawQuery(sql, [id])).first;

    var certificado = CertificadoDto(
      id: linha['id'],
      titulo: linha['titulo'],
      dataEmissao: linha['dataEmissao'],
      descricao: linha['descricao'],
      atividadeId: linha['atividadeId'] as int,
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

    var sql = '''INSERT INTO certificado (titulo, dataEmissao, descricao, 
      atividadeId, quantidadeHoras, verificado, urlImage) 
      VALUES (?, ?, ?, ?, ?, ?, ?)''';
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

    var sql = '''UPDATE certificado 
    SET titulo = ?,
    descricao = ?,
    dataEmissao = ?,
    quantidadeHoras = ?,
    atividadeId = ?,
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
