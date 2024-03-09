import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_logged.dart'; //agregar en un archivo de barril
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_no_logged.dart'; //agregar en un archivo de barril

class FavoriteView extends ConsumerStatefulWidget {
  final bool isTokenAut;

  const FavoriteView({
    super.key,
    required this.isTokenAut, 
  });

  @override
  ConsumerState<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {

  @override
  void initState() {
    ref.read(favoritesHousesProvider.notifier).loadFavoritesFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<HousePreview> favorites = ref.watch(favoritesHousesProvider);
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
            padding: widget.isTokenAut
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 25),
            child: !widget.isTokenAut
                ? const FavoriteViewNoLogged()
                : FavoriteViewLogged(
                    favorites: favorites,
                    size: size,
                  )),
      ),
    );
  }
}
