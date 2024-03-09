import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/house_preview_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_Preview_studenthivedb.dart';

final favoritesHousesProvider = StateNotifierProvider<FavoritesPostsNotifier, List<HousePreview>>((ref){
  return FavoritesPostsNotifier();
});

class FavoritesPostsNotifier extends StateNotifier<List<HousePreview>>{
  FavoritesPostsNotifier() : super([]);

  Future<void> loadFavoritesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesListString = prefs.getStringList('favorites') ?? <String>[];

    List<HousePreview> favorites = [];

    for (String jsonString in favoritesListString) {
      Map<String, dynamic> housePreviewStudentHiveDbMap = jsonDecode(jsonString);
      HousePreviewStudentHiveDb housePreviewStudentHiveDb = HousePreviewStudentHiveDb.fromJson(housePreviewStudentHiveDbMap); //lo mapea a HousePreviewStudentHiveDb
      HousePreview housePreview = HousePreviewMapper.housePreviewStudentHiveDbToEntity(housePreviewStudentHiveDb); // lo convierte a mi entidad
      favorites.add(housePreview);
    }

    state = favorites;
  }
  
  Future<void> addFavorites(HousePreview housePreview) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesListString = prefs.getStringList('favorites') ?? <String>[];

    HousePreviewStudentHiveDb housePreviewStudentHiveDb = HousePreviewMapper.entityToHousePreviewStudentHiveDb(housePreview);
    Map<String, dynamic> housePreviewStudentHiveDbMap = housePreviewStudentHiveDb.toJson(); 
    String housePreviewJson = jsonEncode(housePreviewStudentHiveDbMap); //Convierto el mapa a un json

    if (!favoritesListString.contains(housePreviewJson)) {
      favoritesListString.add(housePreviewJson);
      prefs.setStringList('favorites', favoritesListString);
    }
  }

  Future<void> removeFavorite(HousePreview housePreview) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesListString = prefs.getStringList('favorites') ?? <String>[];

    HousePreviewStudentHiveDb housePreviewStudentHiveDb = HousePreviewMapper.entityToHousePreviewStudentHiveDb(housePreview);
    Map<String, dynamic> housePreviewStudentHiveDbMap = housePreviewStudentHiveDb.toJson();
    String housePreviewStudentHiveDbJson = jsonEncode(housePreviewStudentHiveDbMap);

    if (favoritesListString.contains(housePreviewStudentHiveDbJson)) {
      favoritesListString.remove(housePreviewStudentHiveDbJson);
      prefs.setStringList('favorites', favoritesListString);
    }
  }

}
