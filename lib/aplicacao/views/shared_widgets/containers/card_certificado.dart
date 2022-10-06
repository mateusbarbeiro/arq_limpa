import 'package:flutter/material.dart';

class CardCertificado extends StatelessWidget {
  const CardCertificado({
    Key? key,
    required this.id,
    required this.validado,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  final int id;
  final bool validado;
  final String titulo;
  final String descricao;

  Widget _getIcon() {
    if (validado) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    }

    return const Icon(
      Icons.done_outline,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).primaryColorDark,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  _iconWidget(),
                  _informationWidget(),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  // onTap: () =>
                  //     InformacoesResponderController.buscarResponderPorId(
                  //   context,
                  //   id,
                  //   updateHome,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _informationWidget() {
    return Expanded(
      flex: 3,
      child: Container(
        constraints: const BoxConstraints(minHeight: 102),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              strutStyle: const StrutStyle(fontSize: 20.0),
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                text: titulo,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              strutStyle: const StrutStyle(fontSize: 14.0),
              text: TextSpan(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.65),
                ),
                text: descricao,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _iconWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        width: 60,
        height: 60,
        child: _getIcon(),
      ),
    );
  }
}
