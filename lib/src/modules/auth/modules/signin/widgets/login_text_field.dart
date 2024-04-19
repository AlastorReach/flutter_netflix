import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String? label;
  final String? errorText;
  const LoginTextField({super.key, this.label, this.errorText});

  final errorColor = const Color.fromARGB(255, 235, 57, 66);

  OutlineInputBorder getInputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            label: label != null ? Text(label!) : null,
            errorText: errorText,
            filled: true,
            fillColor: const Color.fromARGB(178, 22, 22, 22),
            border: getInputBorder(const Color.fromARGB(178, 128, 128, 128)),
            errorBorder: getInputBorder(errorColor),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2))));
  }
}
