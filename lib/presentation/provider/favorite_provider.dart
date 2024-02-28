import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class FavoriteProvider extends ChangeNotifier {

  List<RentalHouse> listFavorites = [];

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