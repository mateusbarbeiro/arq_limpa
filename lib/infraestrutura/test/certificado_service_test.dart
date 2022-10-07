import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_certificado_dao.dart';
import 'package:arq_limpa/infraestrutura/test/certificado_dao_test.dart';

class CertificadoServiceTest implements ICertificadoDao {
  ICertificadoDao certificadoDao = CertificadoDaoTest();

  @override
  Future deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<CertificadoDto>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CertificadoDto> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future insert(CertificadoCriarDto object) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future update(CertificadoAtualizarDto object) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future updateSomeFields(Map<String, dynamic> updated) {
    // TODO: implement updateSomeFields
    throw UnimplementedError();
  }
}
