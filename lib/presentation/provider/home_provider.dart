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
      titulo: 'Cerca de la UTM', 
      imagenes: 'https://www.arti-mana.com/wp-content/uploads/decoracion-de-un-cuarto.jpg.webp', 
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
      titulo: 'Cerca de la UTM', 
      imagenes: 'https://static9.depositphotos.com/1007373/1116/i/950/depositphotos_11164055-stock-photo-modern-master-bedroom-interior.jpg', 
      numeroDeCuartosHabitacion: 2, 
      ubicacionHabitacion: 'calle 112b x 54 y 56 ', 
      precioHabitacion: 1300, 
      fechaPublicacion: '16 de diciembre del 2023', 
      estatus: 'disponible', 
      idAnfitrion: 2, 
      nombreAnfitrion:'Angel Yahir Poot Ucan', 
      numeroTelefono: '9992063456', 
      genero: 'masculino'
      )    
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