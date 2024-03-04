import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/publication/favorite_publication_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_empty.dart'; //meter en un archivo de barril
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_no_empty.dart'; //meter en un archivo de barril

class FavoriteViewLogged extends StatelessWidget {
  // final FavoriteProvider favoriteProvider;
  final Size size;

  const FavoriteViewLogged({
    super.key, 
    // required this.favoriteProvider, 
    required this.size
    });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FavoriteList',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ), //TODO: Autentificar si es lista de favoritos no esta vacia.
            // favoriteProvider.listFavorites.isEmpty
            //     ? const ListEmpty()
            //     : ListNoEmpty(favoriteProvider: favoriteProvider, size: size),
          ],
        ),
      ],
    );
  }
}
