import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';

class ListEmptyNoRequest extends StatelessWidget {
  final List<HousePreview> favorites;
  final Size size;

  const ListEmptyNoRequest(
      {super.key, required this.favorites, required this.size});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        direction: Axis.horizontal,
        children: List.generate(favorites.length, (index) {
          final favorite = favorites[index];
          // const Radius radius = Radius.circular(20);
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            //! contenido del contenedor de la solicitud (Contendor principal)
            child: Container(
              alignment: Alignment.center,
              height: size.height * 0.20,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 6,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  //! Contenedor de la imagen
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: size.height * 0.20 * 100,
                    width: size.width * 0.95 * 0.45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        favorite.images[0],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //! Contenedor de la información
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: size.height * 0.20 * 100,
                    width: size.width * 0.95 * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          favorite.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${favorite.rentPrice}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(favorite.nameofUser,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
