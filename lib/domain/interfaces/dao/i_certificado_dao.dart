import '../../dto/certificado_dto.dart';

abstract class ICertificadoDao {
  Future insert(CertificadoCriarDto object);

  Future update(CertificadoAtualizarDto object);

  Future deleteById(int id);

  Future<CertificadoDto> getById(int id);

  Future<List<CertificadoDto>> getAll();

  Future updateSomeFields(Map<String, dynamic> updated);
}
