import 'package:arq_limpa/aplicacao/views/certificado/certificado_page.dart';
import 'package:arq_limpa/aplicacao/views/certificado/controller/certificado_controller.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/containers/card_certificado.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:flutter/material.dart';

class CertificadoWidget extends State<CertificadoPage> {
  CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificados'),
        actions: [
          _addCertificadoBotao(context),
        ],
      ),
      body: _listaCertificados(),
    );
  }

  IconButton _addCertificadoBotao(BuildContext context) {
    return IconButton(
      onPressed: () => controller.goToForm(context).then(
            (value) => setState(() {}),
          ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  FutureBuilder<List<CertificadoDto>> _listaCertificados() {
    return FutureBuilder<List<CertificadoDto>>(
      future: controller.allCertificados,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data != null) {
          var certificadoDto = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: certificadoDto
                  .map(
                    (e) => CardCertificado(
                      id: e.id ?? 0,
                      validado: e.verificado!,
                      titulo: e.titulo,
                      descricao: e.descricao,
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const Text("Nenhum Item cadastrado");
        }
      },
    );
  }
}
