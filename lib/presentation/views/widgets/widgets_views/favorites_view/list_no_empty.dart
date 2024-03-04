import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/publication/favorite_publication_provider.dart';

class ListNoEmpty extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  final Size size;

  const ListNoEmpty({super.key, required this.favoriteProvider, required this.size});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      direction: Axis.horizontal,
      children: List.generate(
        favoriteProvider.listFavorites.length,
        (index) {
          final favoritePublication = favoriteProvider.listFavorites[index];
          const Radius radius = Radius.circular(20);
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              //!FavoriteContainer
              height: size.height * 0.27,
              width: size.width * 0.43,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: radius, topLeft: radius),
              ),
              child: Column(
                children: [
                  Container(
                    //!imagen container
                    height: size.height * 0.27 * 0.75,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // child: Image.network(
                      //   favoritePublication.imagenes,
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    favoritePublication.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
