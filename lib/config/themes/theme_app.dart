
import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(133, 2, 18, 164);
List<Color> listColors = [
  mainColor, 
  Colors.cyan,
  Colors.red,
  Colors.yellow,
  Colors.green, 

];

class ThemesApp {
  final int selectedColor;

  ThemesApp({required this.selectedColor})
 : assert( selectedColor >= 0 && selectedColor <= listColors.length -1, 'selectColor must be between 0 and ${listColors.length -1}');

  ThemeData themes(){
    return ThemeData(
      useMaterial3: false,
      colorSchemeSeed: listColors[selectedColor],
    );
  }
  
}