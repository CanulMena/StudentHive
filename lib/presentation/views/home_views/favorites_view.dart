import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';

class FavoriteView extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  const FavoriteView({super.key, required this.favoriteProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteProvider.listFavorites.length,
      itemBuilder: (context, index) {
        return const _FavoriteContainer();
      },
    );
  }
}

class _FavoriteContainer extends StatelessWidget {
  const _FavoriteContainer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.2,
        decoration: const BoxDecoration(
          color: Colors.red
        ),
      ),
    );
  }
}