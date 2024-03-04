import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_logged.dart'; //agregar en un archivo de barril
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_no_logged.dart'; //agregar en un archivo de barril

class FavoriteView extends StatelessWidget {
  final bool isTokenAut;
  // final FavoriteProvider favoriteProvider;

  const FavoriteView({
    super.key,
    required this.isTokenAut,
    // required this.favoriteProvider,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        strokeWidth: 2,
        onRefresh: () {
          return Future(() {});
        },
        child: Padding(
            padding: isTokenAut
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 25),
            child: !isTokenAut
                ? const FavoriteViewNoLogged()
                : FavoriteViewLogged(
                    // favoriteProvider: favoriteProvider, 
                    size: size,
                  )),
      ),
    );
  }
}
