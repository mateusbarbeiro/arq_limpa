
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTextoWidget extends StatefulWidget {
  const InputTextoWidget({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.isPassword = false,
    this.isIconDate = false,
    this.keyboardType,
    required this.paddingBottom,
    this.maxLength,
    this.paddingTop = 0,
    this.mask,
    this.color = Colors.blueGrey,
    this.colorCurso = Colors.black,
    this.isDarkMode = false,
    this.controller,
    this.onPressedIcon,
    this.icon,
    this.validator,
  }) : super(key: key);

  final String labelText;
  final ValueChanged<String>? onChanged;
  final bool? isPassword;
  final bool? isIconDate;
  final TextInputType? keyboardType;
  final VoidCallback? onPressedIcon;
  final double paddingBottom;
  final double? paddingTop;
  final int? maxLength;
  final String? mask;
  final Color? color;
  final Color? colorCurso;
  final bool isDarkMode;
  final Widget? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  _InputTextoWidget createState() => _InputTextoWidget();
}

class _InputTextoWidget extends State<InputTextoWidget> {
  bool _esconderTextSenha = true;
  Color _corDaBorda = Colors.black;

  @override
  void initState() {
    if (widget.color != _corDaBorda) {
      _corDaBorda = widget.color!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom,
        top: widget.paddingTop!,
        left: 35,
        right: 35,
      ),
      child: TextFormField(
        inputFormatters: [
          MaskTextInputFormatter(
            mask: widget.mask,
          )
        ],
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black,
        ),
        maxLength: widget.maxLength,
        cursorColor: widget.colorCurso,
        onChanged: widget.onChanged,
        obscureText: _esconderTextSenha && (widget.isPassword == true),
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.black),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            //Cor de quando clicar no campo
            borderSide: widget.isDarkMode
                ? const BorderSide(
                    color: Colors.white,
                  )
                : const BorderSide(
                    color: Colors.black,
                  ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(color: _corDaBorda),
          ),
          labelText: widget.labelText,
          suffixStyle: const TextStyle(color: Colors.black),
          labelStyle: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
          suffixIcon: widget.isPassword == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    //??cone para ocultar ou n??o a senha na tela
                    child: Icon(
                      _esconderTextSenha
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        _esconderTextSenha = !_esconderTextSenha;
                      });
                    },
                  ),
                )
              : widget.isIconDate == true
                  ? IconButton(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      icon: widget.icon!,
                      onPressed: widget.onPressedIcon,
                    )
                  : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
