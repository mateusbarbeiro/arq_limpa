import 'package:arq_limpa/domain/entidades/atividade.dart';
import 'package:arq_limpa/domain/entidades/certificado.dart';
import 'package:arq_limpa/domain/entidades/grupo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Certificado certificado = Certificado(
    titulo: "titulo",
    descricao: "descricao",
    dataEmissao: "20-10-2022",
    quantidadeHoras: 10,
    quantidadeHorasValidadas: 10,
    verificado: false,
    atividade: Atividade(
        nome: "atividade",
        maximoHoras: 25,
        equivalencia: 100,
        grupo: Grupo(
          descricao: '',
          horasObrigatorias: 1,
          nome: '',
        )),
  );
  group('validações de quantidadeHoras e quantidadeHorasValidadas', () {
    test('quantidadeHoras deve ser informada (não pode ser zero)', () {
      certificado.quantidadeHoras = 0;
      expect(() => certificado.validarQuantidadeHoras(), throwsException);
    });

    test('quantidadeHoras não pode ser negativa', () {
      certificado.quantidadeHoras = -10;
      expect(() => certificado.validarQuantidadeHoras(), throwsException);
    });

    test('quantidadeHorasValidadas deve ser informada (não pode ser zero)', () {
      certificado.quantidadeHorasValidadas = 0;
      expect(
          () => certificado.validarQuantidadeHorasValidadas(), throwsException);
    });

    test('quantidadeHorasValidadas não pode ser negativa', () {
      certificado.quantidadeHorasValidadas = -10;
      expect(
          () => certificado.validarQuantidadeHorasValidadas(), throwsException);
    });
  });

  group('validações de horas validadas quando certificado for verificado', () {
    certificado.verificado = true;
    test('quantidadeHorasValidadas deve ser informada (não pode ser zero)', () {
      certificado.quantidadeHorasValidadas = 0;
      expect(() => certificado.validarHorasValidadasCertificadoVerificado(),
          throwsException);
    });

    test('quantidadeHorasValidadas não pode ser negativa', () {
      certificado.quantidadeHorasValidadas = -50;
      expect(() => certificado.validarHorasValidadasCertificadoVerificado(),
          throwsException);
    });
  });
}
