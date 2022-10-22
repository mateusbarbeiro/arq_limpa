import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/entidades/atividade.dart';
import 'package:arq_limpa/domain/entidades/certificado.dart';
import 'package:arq_limpa/domain/entidades/grupo.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_certificado_dao.dart';

class CertificadoDaoTest implements ICertificadoDao {
  final Map<String, Certificado> _data = <String, Certificado>{};

  @override
  Future deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<CertificadoDto> getById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future updateSomeFields(Map<String, dynamic> updated) {
    // TODO: implement updateSomeFields
    throw UnimplementedError();
  }

  @override
  Future update(CertificadoAtualizarDto object) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future insert(CertificadoCriarDto object) {
    var entidade = Certificado.criar(
      object,
      Atividade(
        id: 1,
        nome: 'teste',
        maximoHoras: 100,
        equivalencia: 100,
        grupo: Grupo(
            id: 1, horasObrigatorias: 10, nome: "Nome", descricao: "descricao"),
      ),
    );
    _data[entidade.id.toString()] = entidade;
    return Future.value();
  }

  @override
  Future<List<CertificadoDto>> getAll() async {
    List<CertificadoDto> result = [];

    _data.forEach((key, value) {
      result.add(value.toDto());
    });
    return result;
  }
}
