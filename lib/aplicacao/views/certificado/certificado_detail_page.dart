import 'package:arq_limpa/aplicacao/views/certificado/widgets/certificado_detail_widget.dart';
import 'package:flutter/material.dart';

class CertificadoDetailPage extends StatefulWidget {
  final int id;

  const CertificadoDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CertificadoDetailPage> createState() => CertificadoDetailWidget();
}
