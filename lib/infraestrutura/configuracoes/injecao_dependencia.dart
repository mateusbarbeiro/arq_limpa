import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interfaces/dao/i_certificado_dao.dart';
import '../sqlite/certificado_dao_sqlite.dart';
// import 'package:hexa_certificado/dominio/implementation/certificado_service.dart';
// import 'package:hexa_certificado/dominio/ports/i_certificado_dao.dart';
// import 'package:hexa_certificado/dominio/ports/i_certificado_service.dart';
// import 'package:hexa_certificado/infraestrutura/sqlite/certificado_dao_sqlite.dart';

Future setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<ICertificadoDao>(CertificadoDaoSqlite());
//   getIt.registerSingleton<ICertificadoService>(CertificadoService());
}
