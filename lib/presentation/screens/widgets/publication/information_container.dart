import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class InformationContainer extends StatelessWidget {
  final Publication imagePost;
  const InformationContainer({super.key, required this.imagePost});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromRGBO(222, 236, 239, 1);
    final size = MediaQuery.of(context).size;
    const Radius radius = Radius.circular(20); 
    return Container(
      //! Contenedor de información
      height: size.height * 0.56 * 0.25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius
        ),
        color: mainColor
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: imagePost.titulo,
                fontSize: 16, 
                fontWeight: FontWeight.w700,
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: imagePost.fechaPublicacion, 
                fontSize: 16,
                fontWeight: FontWeight.w500,
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _CustomText(
                imagePost: ' \$${imagePost.precioHabitacion.toString()} MXN',
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