import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF159A9C))),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF159A9C), width: 3)),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) => const TextStyle(color: Color(0xFF159A9C))),
      

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
          borderSide: BorderSide(color: Color(0xFF159A9C))),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF159A9C), width: 3)),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) => const TextStyle(color: Color(0xFF159A9C))),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
    );
  }
}
