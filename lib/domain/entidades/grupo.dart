import 'package:arq_limpa/domain/entidades/atividade.dart';

class Grupo {
  int? id;
  String nome;
  String descricao;
  int horasObrigatorias;
  List<Atividade>? atividades;

  Grupo({
    this.id,
    required this.nome,
    required this.descricao,
    required this.horasObrigatorias,
  });
}
