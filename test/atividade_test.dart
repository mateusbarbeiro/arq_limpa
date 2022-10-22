import 'package:arq_limpa/domain/entidades/atividade.dart';
import 'package:arq_limpa/domain/entidades/grupo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Atividade atividade = Atividade(
      id: 1,
      nome: 'teste',
      equivalencia: 100,
      maximoHoras: 50,
      grupo: Grupo(
        id: 1,
        nome: "teste grupo",
        horasObrigatorias: 50,
        descricao: "testes dicrição",
      ));

  group('Validações do nome da atividade', () {
    test('Validar tamanho do nome da atividade', () {
      atividade.nome = 'ab';
      expect(() => atividade.validarNome(), throwsException);
    });
  });
  group('Validações de máximo de horas', () {
    test('Deve ser informado quantidade máxima de horas', () {
      atividade.maximoHoras = 0;
      expect(() => atividade.validarMaximoHoras(), throwsException);
    });

    test('Quantidade máxima de horas não podem ser negativas', () {
      atividade.maximoHoras = -1;
      expect(() => atividade.validarMaximoHoras(), throwsException);
    });
  });

  group('Validações de equivalência', () {
    test('Deve ser informado equivalencia', () {
      atividade.equivalencia = 0;
      expect(() => atividade.validarEquivalencia(), throwsException);
    });

    test('Equivalencia não pode ser negativa', () {
      atividade.equivalencia = -1;
      expect(() => atividade.validarEquivalencia(), throwsException);
    });

    test('Equivalencia não pode ser maior que 100', () {
      atividade.equivalencia = 2000;
      expect(() => atividade.validarEquivalencia(), throwsException);
    });
  });
}
