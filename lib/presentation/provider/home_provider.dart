import 'package:flutter/material.dart';
import 'package:studenthive/data/local_image_data.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/models/local_publication_image_model.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedIndex = 0; 

  int get selectedIndex => _selectedIndex;//Configuramos que la variable siempre inicie con 0

  List<Publication> publications = [];

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> nextPublication() async {
    //Estamos convirtiendo todos los mapas a listas
    await Future.delayed(const Duration(seconds: 1));
  List<Publication> newPublications = image.map(
    (publication) => LocalPublicationImageModel.fromJson(publication).toImagePost()
  ).toList();

  publications.addAll(newPublications);
  notifyListeners();
  }
}