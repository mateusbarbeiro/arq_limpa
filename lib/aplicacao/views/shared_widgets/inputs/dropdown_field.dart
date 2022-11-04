import 'package:flutter/material.dart';

class DropDownField<T> extends StatelessWidget {
  final String labelText;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final double paddingBottom;
  final double paddingTop;
  final String? Function(T?)? validator;
  final Color? backgroundColor;
  final Color? textColor;
  final bool enabled;

  const DropDownField({
    Key? key,
    this.labelText = '',
    this.options = const [],
    required this.getLabel,
    this.value,
    required this.onChanged,
    this.paddingBottom = 5,
    this.paddingTop = 0,
    this.validator,
    this.backgroundColor,
    this.textColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingBottom,
        top: paddingTop,
        left: 35,
        right: 35,
      ),
      child: DropdownButtonFormField<T>(
          isExpanded: true,
        items: options.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              overflow: TextOverflow.ellipsis,
              getLabel(value),
            ),
          );
        }).toList(),
        onChanged: !enabled ? null : onChanged,
        value: value,
        validator: validator,
        elevation: 2,
        style: TextStyle(
          color: textColor ?? Colors.black,
          overflow: TextOverflow.ellipsis,
          fontSize: 17,
        ),
        isDense: true,
        iconSize: 30.0,
        iconEnabledColor: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(10.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
          focusedBorder: const OutlineInputBorder(
            //Cor de quando clicar no campo
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
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
        focusColor: Colors.transparent,
      ),
    );
  }

  InputBorder _customBorder(BuildContext context, [Color? color]) {
    color ??= Theme.of(context).primaryColor;

    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      borderSide: BorderSide(color: color),
    );
  }
}
