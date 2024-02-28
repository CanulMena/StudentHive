
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final List<String> imagesPost;
  const ImageContainer({super.key, required this.imagesPost});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),  // Color de la sombra
        spreadRadius: 6,  // Distancia de la propagación de la sombra
        blurRadius: 6,  // Radio del desenfoque de la sombra
        offset: const Offset(0, 3),  // Desplazamiento de la sombra
        ),
      ],
    );

    return Container(
      //! Contenedor de imagen
      height: size.height * 0.51 * 0.75,
      decoration: decoration,
      child: Swiper(
        itemCount: imagesPost.length,
        scale: .9,
        itemBuilder: (context, index) {
          final imagenPost = imagesPost[index];
          return _Slide(imagenPost: imagenPost, decoration: decoration,);
        },
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white70, 
            color: Colors.grey
          )
        ),
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final String imagenPost;
  final BoxDecoration decoration;
  const _Slide({
    required this.imagenPost, required this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imagenPost, 
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if( loadingProgress != null){
            return const Center( child: CircularProgressIndicator() );
          }
            return child;
        },
      ),
    );
  }
}