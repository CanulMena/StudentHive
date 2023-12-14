import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/repositories/publication_repositories_impl.dart';

class HomeProvider extends ChangeNotifier {

  final PublicationRepositoriesImpl publicationRepositoriesImpl;

  HomeProvider({
    required this.publicationRepositoriesImpl
  });

  int selectedView = 0; 

  bool isGetPublication = false;

  List<Publication> publications = [];

  void selectView(int viewPage) {
    selectedView = viewPage;
    notifyListeners();
  }

  Future<void> getPublications() async {
    final List<Publication> newPublications =  await publicationRepositoriesImpl.getInformationPublication();
    
    publications.addAll(newPublications);
    isGetPublication = true;
    notifyListeners();
  } 
}