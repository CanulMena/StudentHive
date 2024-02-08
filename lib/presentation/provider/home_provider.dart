import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/repositories/publication_repositories_impl.dart';

class HomeProvider extends ChangeNotifier {

  final PublicationRepositoriesImpl publicationRepositoriesImpl;

  HomeProvider({
    required this.publicationRepositoriesImpl
  });

  int selectedView = 0; 

  bool isLoading = false;

  List<Publication> publications = [
    Publication(
      idPublicacion: 1, 
      titulo: 'Tu mejor opcion', 
      imagenes: [
        'https://i.pinimg.com/564x/25/8c/e9/258ce944a38c11e8a2da9e9e6b378f90.jpg',
        'https://i.pinimg.com/564x/2e/7f/48/2e7f485ebf5e6a539ad3ac8dc07ae13d.jpg',
        'https://i.pinimg.com/564x/0c/e4/c0/0ce4c0bf5bc4ef65b28efbe6c31aef5f.jpg'
      ], 
      numeroDeCuartosHabitacion: 2, 
      ubicacionHabitacion: 'calle 111b x 52a y 54', 
      precioHabitacion: 1200, 
      fechaPublicacion: '12 de diciembre del 2023', 
      estatus: 'disponible', 
      idAnfitrion: 1, 
      nombreAnfitrion:'Gustavo Canul Mena', 
      numeroTelefono: '9991402885', 
      genero: 'masculino'
      ),

    Publication(
      idPublicacion: 2, 
      titulo: 'Busco gente responsable', 
      imagenes: [
        'https://i.pinimg.com/564x/99/2d/1a/992d1a380ae061ad25c779990a95930a.jpg',
        'https://i.pinimg.com/564x/dc/16/80/dc1680e3656140da0ef1b57feaa095e3.jpg',
        'https://i.pinimg.com/564x/e8/1d/83/e81d836940072815e686eb83b78efac1.jpg',
        
      ], 
      numeroDeCuartosHabitacion: 2, 
      ubicacionHabitacion: 'calle 112b x 54 y 56 ', 
      precioHabitacion: 1300, 
      fechaPublicacion: '16 de diciembre del 2023', 
      estatus: 'disponible', 
      idAnfitrion: 2, 
      nombreAnfitrion:'Angel Yahir Poot Ucan', 
      numeroTelefono: '9992063456', 
      genero: 'masculino'
      ),   
  ];

  void selectView(int viewPage) {
    selectedView = viewPage;
    notifyListeners();
  }

  // Future<void> getPublications() async {
  //   final List<Publication> newPublications =  await publicationRepositoriesImpl.getInformationPublication();
    
  //   publications.addAll(newPublications);
  //   isLoading = false;
  //   notifyListeners();
  // } 
}