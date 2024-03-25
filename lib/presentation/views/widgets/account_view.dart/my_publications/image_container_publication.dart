import 'package:flutter/material.dart';

class MyPublicationsImageContainer extends StatelessWidget {
  final String imageUrl;
  const MyPublicationsImageContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.51 * 0.75,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Color de la sombra
            spreadRadius: 6, // Distancia de la propagación de la sombra
            blurRadius: 6, // Radio del desenfoque de la sombra
            offset: const Offset(0, 3), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
