import 'package:arq_limpa/domain/entidades/atividade.dart';

class Grupo {
  int? id;
  String nome;
  String descricao;
  int horasObrigatorias;

  Grupo({
    this.id,
    required this.nome,
    required this.descricao,
    required this.horasObrigatorias,
  });

  void validarNome() {
    nome.length <= 3
        ? throw Exception('Nome não pode conter menos que 3 caracteres')
        : null;
  }

  void validarDescricao() {
    descricao.length <= 10
        ? throw Exception('Descrição não pode conter menos que 10 caracteres')
        : null;
  }

  void validarMaximoHoras() {
    horasObrigatorias == 0
        ? throw Exception('Deve ser informado quantidade de horas obrigatórias')
        : null;

    horasObrigatorias < 0
        ? throw Exception(
            'Quantidade obrigatória de horas não pode ser negativa')
        : null;
  }
}
