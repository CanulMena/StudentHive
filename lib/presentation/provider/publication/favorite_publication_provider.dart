import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/publication.dart';

final favoritesPostsProvider = StateNotifierProvider<FavoritesPostsNotifier, List>((ref){
  return FavoritesPostsNotifier();
});

class FavoritesPostsNotifier extends StateNotifier<List>{
  FavoritesPostsNotifier() : super([]);

  void addFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //pero como es que jode esta madre del instance.
  }
}


class FavoriteProvider extends ChangeNotifier {//*Convertiré esto en un StateNotifierProvider

  List<RentalHouse> listFavorites = []; //*Guardaré estoy en shared-preferences

  void addFavorites( RentalHouse favorite){
    if(!containsFavorites(favorite)){
      listFavorites.add(favorite);
      notifyListeners();
    }    

  }

  void deleteFavorites( RentalHouse favorite ){
    listFavorites.remove(favorite);
    notifyListeners();
  }

  bool containsFavorites( RentalHouse favorite) {
    return listFavorites.any((favorite) => favorite.idPublication == favorite.idPublication);
  }

}