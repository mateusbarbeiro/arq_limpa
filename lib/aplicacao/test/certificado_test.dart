// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:arq_limpa/aplicacao/test/certificado_test.mocks.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/infraestrutura/test/certificado_service_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CertificadoServiceTest])
void main() {
  group('Certificado', () {
    test('Insere', () async {
      var mock = MockCertificadoServiceTest();
      var service = CertificadoServiceTest();

      var certificado = CertificadoDto(
        id: 1,
        descricao: 'teste',
        quantidadeHoras: 5,
        urlImagem: '',
        atividadeId: 1,
        dataEmissao: "20/10/2022",
        titulo: "teste",
        horasValidadas: 10,
        verificado: false,
      );
      service.insert(certificado);

      var esperado = <CertificadoDto>[certificado];

      when(mock.getAll()).thenAnswer(
        (_) => Future.value(esperado),
      );

      var buscado = await service.getAll();

      expect(buscado.first.id, esperado.first.id);
      expect(buscado.first.descricao, esperado.first.descricao);
    });
  });
}
