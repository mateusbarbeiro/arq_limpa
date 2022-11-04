import 'package:arq_limpa/aplicacao/views/certificado/controller/grupo_controller.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/botoes/botao_widget.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/botoes/custom_switch.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/dropdown_field.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/input_data_widget.dart';
import 'package:arq_limpa/aplicacao/views/shared_widgets/inputs/input_texto_widget.dart';
import 'package:arq_limpa/domain/dto/grupo_dto.dart';
import 'package:flutter/material.dart';

import '../../../../domain/dto/atividade_dto.dart';
import '../certificado_form_page.dart';
import '../controller/atividade_controller.dart';
import '../controller/certificado_controller.dart';

class CertificadoPageWidget extends State<CertificadoFormPage> {
  final formKey = GlobalKey<FormState>();

  final CertificadoController controller = CertificadoController();
  final GrupoController grupoController = GrupoController();
  final AtividadeController atividadeController = AtividadeController();
  List<GrupoDto> grupos = [];
  List<AtividadeDto> atividades = [];

  @override
  void initState() {
    super.initState();

    grupoController.allGrupos.then((value) {
      setState(() {
        grupos = value;
      });
    });
  }

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
              // inputHorasValidas(),
              // certificadoValido(),
              inputGrupo(),
              inputAtividade(),
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
      paddingTop: 0,
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

  DropDownField inputAtividade() {
    return DropDownField<AtividadeDto>(
      paddingTop: 15,
      getLabel: (x) => x.nome,
      value: controller.atividade,
      options: atividades,
      onChanged: (d) {
        controller.atividade = d;
      },
      enabled: controller.grupo == null,
      labelText: 'Atividade',
    );
  }

  DropDownField inputGrupo() {
    return DropDownField<GrupoDto>(
      paddingTop: 15,
      getLabel: (x) => x.nome,
      value: controller.grupo,
      options: grupos,
      labelText: 'Grupo',
      onChanged: (d) {
        setState(() {
          controller.atividade = null;
          getAtividade(d?.id ?? 1);
        });
      },
    );
  }

  void getAtividade(int id) {
    atividadeController.atividadesDoGrupo(id).then((value) {
      atividades = value;
    });
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
