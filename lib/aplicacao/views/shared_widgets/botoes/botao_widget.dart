import 'package:flutter/material.dart';

class BotaoWidget extends StatefulWidget {
  const BotaoWidget({
    Key? key,
    required this.labelText,
    this.onPressed,
    this.largura,
    required this.paddingTop,
    required this.paddingBottom,
    required this.corBotao,
    required this.corTexto,
  }) : super(key: key);

  final String labelText;
  final VoidCallback? onPressed;
  final double? largura;
  final Color corBotao;
  final Color corTexto;
  final double paddingTop;
  final double paddingBottom;

  @override
  _BotaoWidget createState() => _BotaoWidget();
}

class _BotaoWidget extends State<BotaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop,
        bottom: widget.paddingBottom,
      ),
      child: Container(
        width: widget.largura,
        height: 47,
        padding: const EdgeInsets.only(
          bottom: 0,
          top: 0,
          left: 14,
          right: 14,
        ),
        decoration: BoxDecoration(
          color: widget.corBotao,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: widget.corTexto,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}