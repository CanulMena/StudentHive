import 'package:flutter/material.dart';

// List<Color> listColors = [
//   Colors.cyan,
//   Colors.white
// ];

class ThemesApp {
  // final int selectedColor;

  // ThemesApp({required this.selectedColor})
  // : assert( selectedColor >= 0 && selectedColor <= listColors.length -1, 'selectColor must be between 0 and ${listColors.length -1}');

  ThemeData themes(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:  Colors.yellow/* listColors[selectedColor] */,
    );
  }
  
}