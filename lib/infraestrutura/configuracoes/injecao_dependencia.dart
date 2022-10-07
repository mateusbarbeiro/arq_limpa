import 'package:arq_limpa/domain/interfaces/dao/i_atividade_dao.dart';
import 'package:arq_limpa/domain/interfaces/dao/i_grupo_dao.dart';
import 'package:arq_limpa/infraestrutura/sqlite/atividade_dao_sqlite.dart';
import 'package:arq_limpa/infraestrutura/sqlite/grupo_dao_sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interfaces/dao/i_certificado_dao.dart';
import '../sqlite/certificado_dao_sqlite.dart';

Future setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<ICertificadoDao>(CertificadoDaoSqlite());
  getIt.registerSingleton<IAtividadeDao>(AtividadeDaoSqlite());
  getIt.registerSingleton<IGrupoDao>(GrupoDaoSqlite());
}
