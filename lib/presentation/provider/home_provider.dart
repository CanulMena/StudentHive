import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/repositories/publication_repositories_impl.dart';

class HomeProvider extends ChangeNotifier {

  final PublicationRepositoriesImpl publicationRepositoriesImpl;

  HomeProvider({
    required this.publicationRepositoriesImpl
  });

  int _selectedIndex = 0; 

  int get selectedIndex => _selectedIndex;//Configuramos que la variable siempre inicie con 0

  List<Publication> publications = [];

  // final GetPublication getPublication = GetPublication();

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> nextPublications() async {
  try {
    final List<Publication> newPublications = await publicationRepositoriesImpl.getInformationPublication();
    
    publications.addAll(newPublications);

    notifyListeners();
  } catch (error) {
    throw 'we have an error';
    // Puedes manejar el error de manera apropiada según tus necesidades
  }
 }
}