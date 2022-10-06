import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.paddingBottom,
    required this.paddingTop,
    this.isDarkMode = false,
  }) : super(key: key);

  final String label;
  final bool value;
  final void Function(bool)? onChanged;
  final double paddingBottom;
  final double? paddingTop;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingBottom,
        top: paddingTop!,
        left: 35,
        right: 35,
      ),
      child: InputDecorator(
        isEmpty: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 3,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
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
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
