import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 156, 134, 21))),
      focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 156, 138, 21), width: 3)),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) =>
          const TextStyle(color: Color.fromARGB(255, 156, 138, 21))),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
    );
  }
}

class InputDecorations2 {
  static InputDecoration inputDecoration2({
    required String hintText,
    required String labelText,
    required Icon prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 156, 134, 21))),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 156, 134, 21), width: 3)),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) => const TextStyle(color: Color.fromARGB(255, 156, 134, 21))),
      hintText:
          hintText, //*Será lo que saldrá en el textFormField antes que escribamos
      labelText: labelText,
      prefixIcon:
          prefixIcon, //*Este es el icon que aparece en la parte izquierda del TextFormField
    );
  }
}
