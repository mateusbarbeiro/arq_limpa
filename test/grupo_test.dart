import 'package:arq_limpa/domain/entidades/grupo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Grupo grupo = Grupo(
    id: 1,
    nome: 'teste grupo',
    descricao: 'descricao grupo',
    horasObrigatorias: 10,
  );

  group('Validações do nome e descrição do Grupo', () {
    test('Nome não pode conter menos que 3 caracteres', () {
      grupo.nome = 'ab';
      expect(() => grupo.validarNome(), throwsException);
    });

    test('Descrição não pode conter menos que 10 caracteres', () {
      grupo.descricao = 'ab';
      expect(() => grupo.validarDescricao(), throwsException);
    });
  });

  group('Validações de horas obrigatórias', () {
    test('Deve ser informado quantidade de horas obrigatórias', () {
      grupo.horasObrigatorias = 0;
      expect(() => grupo.validarMaximoHoras(), throwsException);
    });

    test('Quantidade obrigatória de horas não pode ser negativa', () {
      grupo.horasObrigatorias = -1;
      expect(() => grupo.validarMaximoHoras(), throwsException);
    });
  });
}
