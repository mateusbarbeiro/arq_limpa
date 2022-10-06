import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  const AppDropdownInput({
    Key? key,
    this.hintText = 'Por favor, selecione uma opção',
    this.options = const [],
    required this.getLabel,
    this.value,
    required this.onChanged,
    required this.paddingBottom,
    this.paddingTop,
    this.isDarkMode = false,
  }) : super(key: key);

  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final double paddingBottom;
  final double? paddingTop;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: paddingBottom,
            top: paddingTop!,
            left: 35,
            right: 35,
          ),
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              labelText: hintText,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
              focusedBorder: OutlineInputBorder(
                //Cor de quando clicar no campo
                borderSide: isDarkMode
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
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            isEmpty: value == null || value == '',
            child: DropdownButton<T>(
              underline: Container(),
              focusColor: Colors.white,
              isExpanded: true,
              borderRadius: BorderRadius.circular(10.0),
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
