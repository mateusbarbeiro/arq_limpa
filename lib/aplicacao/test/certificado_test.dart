import 'package:arq_limpa/infraestrutura/test/certificado_service_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([CertificadoServiceTest])
void main() {
  // group('Certificado', () {
  //   test('Insere', () async {
  //     var mock = MockCertificadoServiceTest();
  //     var service = CertificadoServiceTest();
  //
  //     var certificado = CertificadoDto(
  //       id: 1,
  //       descricao: 'teste',
  //       quantidadeHoras: 5,
  //     );
  //     service.insert(certificado);
  //
  //     var esperado = <CertificadoDto>[certificado];
  //
  //     when(mock.getAll()).thenAnswer(
  //           (_) => Future.value(esperado),
  //     );
  //
  //     var buscado = await service.getAll();
  //
  //     expect(buscado.first.id, esperado.first.id);
  //     expect(buscado.first.descricao, esperado.first.descricao);
  //   });
  // });
}
