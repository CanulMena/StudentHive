import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_empty.dart'; //meter en un archivo de barril
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_no_empty.dart'; //meter en un archivo de barril

class FavoriteViewLogged extends StatelessWidget {
  final List<HousePreview> favorites;
  final Size size;

  const FavoriteViewLogged({
    super.key, 
    required this.size, 
    required this.favorites
    });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FavoriteList',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            favorites.isEmpty ? const ListEmpty() : ListNoEmpty(size: size, favorites: favorites,)
          ],
        ),
      ],
    );
  }
}
