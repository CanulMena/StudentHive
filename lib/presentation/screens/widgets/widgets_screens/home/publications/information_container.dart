import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class InformationContainer extends StatelessWidget {
  final Publication informationPost;
  const InformationContainer({super.key, required this.informationPost});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(//! Contenedor de información
      height: size.height * 0.50 * 0.25,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: informationPost.titulo,
                fontSize: 16, 
                fontWeight: FontWeight.w700,
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: informationPost.fechaPublicacion, 
                fontSize: 16,
                fontWeight: FontWeight.w500,
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: ' \$${informationPost.precioHabitacion.toString()} MXN',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
final double? fontSize;
  final FontWeight? fontWeight;
  final String imagePost;
  const _CustomText({
    required this.imagePost, 
    this.fontSize, 
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      imagePost,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
      );
  }
}