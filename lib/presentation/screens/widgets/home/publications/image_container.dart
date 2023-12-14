import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class ImageContainer extends StatelessWidget {
  final Publication imagePost;
  const ImageContainer({super.key, required this.imagePost});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Radius radius = Radius.circular(20); 
    return Container(
      //! Contenedor de imagen
      height: size.height * 0.56 * 0.75,
      decoration: const BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: radius,
          topRight: radius
        ),
        child: Image.network(
          imagePost.imagenes,
          width: double.infinity,//*Con el valor double.infinity indicamos que debe tomar todo el ancho disponible dentro su contenedor
          height: size.height * 0.56 * 0.75,
          fit: BoxFit.cover,//*La propiedad fit nos indica como debe de ajustarse la imagen dentro de su area disponible 
          ),
      ),
    );
  }
}