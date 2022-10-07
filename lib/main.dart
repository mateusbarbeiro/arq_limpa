import 'package:arq_limpa/aplicacao/my_app.dart';
import 'package:flutter/material.dart';

import 'infraestrutura/configuracoes/injecao_dependencia.dart';

void main() async {
  await setupInjection();
  runApp(const MyApp());
}
