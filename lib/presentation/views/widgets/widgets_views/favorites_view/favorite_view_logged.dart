import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_empty.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/list_no_empty.dart';

class FavoriteViewLogged extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  final Size size;

  const FavoriteViewLogged({Key? key, required this.favoriteProvider, required this.size}) : super(key: key);

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
            favoriteProvider.listFavorites.isEmpty
                ? const ListEmpty()
                : ListNoEmpty(favoriteProvider: favoriteProvider, size: size),
          ],
        ),
      ],
    );
  }
}
