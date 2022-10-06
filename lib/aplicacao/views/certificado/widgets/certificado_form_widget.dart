import 'package:arq_limpa/aplicacao/views/shared_widgets/botoes/botao_widget.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/botoes/custom_switch.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/app_dropdown_input.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/input_data_widget.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/input_texto_widget.dart';
import 'package:flutter/material.dart';
import '../controller/certificado_controller.dart';
import '../certificado_form_page.dart';

class CertificadoPageWidget extends State<CertificadoFormPage> {
  final formKey = GlobalKey<FormState>();

  final CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    controller.quantHorasValidadasController.text = '0';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              inputTitulo(),
              inputDescricao(),
              inputData(),
              inputHoras(),
              inputHorasValidas(),
              certificadoValido(),
              inputCategoria(),
              inputUrl(),
              botaoCadastrar(),
            ],
          ),
        ),
      ),
    );
  }

  InputTextoWidget inputTitulo() {
    return InputTextoWidget(
      labelText: "Titulo",
      paddingBottom: 0,
      maxLength: 50,
      paddingTop: 35,
      isIconDate: true,
      icon: const Icon(
        Icons.text_format,
        color: Colors.black87,
      ),
      controller: controller.tituloController,
      //validator: controller.nomeValidator,
    );
  }

  InputTextoWidget inputDescricao() {
    return InputTextoWidget(
      labelText: "Descrição",
      paddingBottom: 0,
      maxLength: 200,
      paddingTop: 18,
      isIconDate: true,
      icon: const Icon(
        Icons.text_fields,
        color: Colors.black87,
      ),
      controller: controller.descricaoController,
      //validator: controller.nomeValidator,
    );
  }

  InputDataWidget inputData() {
    return InputDataWidget(
      hintText: 'Data emissão',
      paddingBottom: 0,
      paddingTop: 15,
      onChanged: (String? value) {
        setState(
          () {
            if (value != null) {
              controller.dataEmissaoController.text = value;
            }
          },
        );
      },
      controller: controller.dataEmissaoController,
      // validator: controller.dataValidator,
    );
  }

  InputTextoWidget inputHoras() {
    return InputTextoWidget(
      labelText: "Quantidae horas",
      keyboardType: TextInputType.number,
      mask: "####",
      paddingBottom: 0,
      maxLength: 4,
      paddingTop: 15,
      isIconDate: true,
      icon: const Icon(
        Icons.lock_clock,
        color: Colors.black87,
      ),
      controller: controller.quantHorasController,
    );
  }

  InputTextoWidget inputHorasValidas() {
    return InputTextoWidget(
      labelText: "Quantidae horas validadas",
      keyboardType: TextInputType.number,
      mask: "####",
      paddingBottom: 0,
      maxLength: 4,
      paddingTop: 15,
      isIconDate: true,
      icon: const Icon(
        Icons.lock_clock,
        color: Colors.black87,
      ),
      controller: controller.quantHorasValidadasController,
    );
  }

  CustomSwitch certificadoValido() {
    return CustomSwitch(
      paddingTop: 15,
      paddingBottom: 0,
      label: "Certifcado valido",
      value: controller.status,
      onChanged: (bool value) {
        setState(() {
          controller.status = value;
        });
      },
    );
  }

  AppDropdownInput inputCategoria() {
    return AppDropdownInput<String>(
      paddingBottom: 0,
      paddingTop: 30,
      hintText: "Grupo",
      options: controller.grupos,
      value: controller.grupo,
      onChanged: (String? value) {
        setState(() {
          if (value != null) {
            controller.grupo = value;
          }
        });
      },
      getLabel: (String value) => value,
    );
  }

  InputTextoWidget inputUrl() {
    return InputTextoWidget(
      labelText: "Url imagem",
      paddingBottom: 0,
      maxLength: 200,
      paddingTop: 25,
      isIconDate: true,
      icon: const Icon(
        Icons.image,
        color: Colors.black87,
      ),
      controller: controller.urlImagemController,
    );
  }

  BotaoWidget botaoCadastrar() {
    return BotaoWidget(
      paddingTop: 20,
      paddingBottom: 30,
      labelText: "CADASTRAR",
      largura: 340,
      corBotao: Theme.of(context).primaryColorDark,
      corTexto: Colors.white,
      onPressed: () => controller.insertCertificado(context),
    );
  }
}
