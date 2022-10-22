import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:flutter/material.dart';

import '../certificado_detail_page.dart';
import '../controller/certificado_controller.dart';

class CertificadoDetailWidget extends State<CertificadoDetailPage> {
  final CertificadoController _controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CertificadoDto>(
      future: _controller.getById(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var data = snapshot.data!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: const []),
          ),
        );
      },
    );
  }
}
