import 'package:flutter/material.dart';

class HiveIcon extends StatelessWidget {
  final double size;
  final double iconSize;
  const HiveIcon({super.key, required this.size, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: size /* top: size.height * 0.001 */),
        width: double
            .infinity, //?Ocupamos todo el ancho de la pantalla del telefono
        child: Icon(
          Icons.hive_outlined, //el icono
          size:
              iconSize, // el tamaño que tomará el icono - importante saber que puede copar todo el tamaño de la pantalla gracias al width del container
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
