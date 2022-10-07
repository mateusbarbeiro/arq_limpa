// import 'package:hexa_certificado/dominio/dtos/certificado_dto.dart';
// import 'package:hexa_certificado/dominio/models/certificado.dart';
// import 'package:hexa_certificado/dominio/ports/i_certificado_dao.dart';

// class CertificadoDaoTest implements ICertificadoDao {
//   final Map<String, Certificado> _data = <String, Certificado>{};

//   @override
//   Future deleteById(int id) {
//     // TODO: implement deleteById
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<CertificadoDto>> getAll() async {
//     List<CertificadoDto> result = [];

//     _data.forEach((key, value) {
//       result.add(value.toDto());
//     });
//     return result;
//   }

//   @override
//   Future<CertificadoDto> getById(int id) {
//     // TODO: implement getById
//     throw UnimplementedError();
//   }

//   @override
//   Future insert(CertificadoDto object) {
//     var entidade = Certificado.fromDto(object);
//     // entidade.validaHoras();

//     _data[entidade.id.toString()] = entidade;
//     return Future.value();
//   }

//   @override
//   Future update(CertificadoDto object) {
//     // TODO: implement update
//     throw UnimplementedError();
//   }
// }
