import 'package:arq_limpa/domain/entidades/atividade.dart';

import '../../dto/atividade_dto.dart';

abstract class IAtividadeCaso {
  Future<AtividadeDto> buscaAtividade(int id);
}
