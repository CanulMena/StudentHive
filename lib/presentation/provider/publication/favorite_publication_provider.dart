import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/rentalhouse.dart';

final favoritesPostsProvider = StateNotifierProvider<FavoritesPostsNotifier, List<RentalHouse>>((ref){
  return FavoritesPostsNotifier();
});

class FavoritesPostsNotifier extends StateNotifier<List<RentalHouse>>{
  FavoritesPostsNotifier() : super([]);

  Future<void> loadFavoritesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesListString = prefs.getStringList('favorites') ?? [];

    List<RentalHouse> favorites = [];

    for (String jsonString in favoritesListString) {
      Map<String, dynamic> rentalHouseMap = jsonDecode(jsonString);
      RentalHouse rentalHouse = RentalHouse.fromJson(rentalHouseMap);
      favorites.add(rentalHouse);
    }

    state = favorites;
  }

  void addFavorites( RentalHouse rentalHouse ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    //*Llamo a toda la lista de strings --> mis favoritos guardados en formato json
    List<String> favoritesListString = prefs.getStringList('favorites') ?? <String>[];

    //*Convierto en un mapa al rentalhouse que agregue cuando ejecute la funcion
    Map<String, dynamic> rentalHouseMap = rentalHouse.toJson();

    //*Convierto el mapa a una cadena json
    String rentalhouseJson = jsonEncode(rentalHouseMap);

    //* Agrego la cadena JSON a la lista de favoritos
    favoritesListString.add(rentalhouseJson);

    //* Guardo la lista de favoritos actualizada en SharedPreferences -> la lista de strings
    prefs.setStringList('favorites', favoritesListString);
  }
}


// class FavoriteProvider extends ChangeNotifier {//*Convertiré esto en un StateNotifierProvider

//   List<RentalHouse> listFavorites = []; //*Guardaré estoy en shared-preferences

//   void addFavorites( RentalHouse favorite){
//     if(!containsFavorites(favorite)){
//       listFavorites.add(favorite);
//       notifyListeners();
//     }    

//   }

//   void deleteFavorites( RentalHouse favorite ){
//     listFavorites.remove(favorite);
//     notifyListeners();
//   }

//   bool containsFavorites( RentalHouse favorite) {
//     return listFavorites.any((favorite) => favorite.idPublication == favorite.idPublication);
//   }

// }