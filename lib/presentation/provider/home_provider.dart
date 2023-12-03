import 'package:flutter/material.dart';
import 'package:studenthive/data/local_image_data.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/models/local_publication_image_model.dart';
import 'package:studenthive/presentation/views/acount_view.dart';
import 'package:studenthive/presentation/views/favorites_view.dart';
import 'package:studenthive/presentation/views/notificatino_view.dart';
import 'package:studenthive/presentation/views/publication_view.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedIndex = 0; 

  int get selectedIndex => _selectedIndex;//Configuramos que la variable siempre inicie con 0

  List<Publication> publications = [];

  List<Widget> screens = [
    const PublicationView(),
    const NotificationView(),
    const AcountView(),
    const FavoriteView()
  ];
  
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> nextPublication() async {
  List<Publication> newPublications = image.map(
    (publication) => LocalPublicationImageModel.fromJson(publication).toImagePost()
  ).toList();

  publications.addAll(newPublications);
  notifyListeners();
  }
}