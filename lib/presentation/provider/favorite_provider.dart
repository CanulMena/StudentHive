
import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Publication> listFavorites = [];

  void addFavorites( Publication favorite){
    if(!containsFavorites(favorite)){
      listFavorites.add(favorite);
    }    
  }

  void deleteFavorites( Publication favorite ){
    listFavorites.remove(favorite);
  }

  bool containsFavorites( Publication favorite) {
    return listFavorites.any((element) => favorite.idPublicacion == element.idPublicacion);
  }
}