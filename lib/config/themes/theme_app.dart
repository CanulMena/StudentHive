
import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(135, 16, 184, 203);
List<Color> moreColors = [
  mainColor, 
  Colors.red,
  Colors.yellow,
  Colors.green, 
];

class ThemesApp {
  final int selectColor;

  ThemesApp({required this.selectColor})
 : assert( selectColor >= 0 && selectColor <= moreColors.length -1, 'selectColor must be between 0 and ${moreColors.length -1}');

  ThemeData themes(){
    return ThemeData(
      useMaterial3: false,
      colorSchemeSeed: moreColors[selectColor]
    );
  }
  
}