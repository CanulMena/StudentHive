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
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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
    Publication(
      idPublicacion: 1, 
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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
    Publication(
      idPublicacion: 1, 
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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
    Publication(
      idPublicacion: 1, 
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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
    Publication(
      idPublicacion: 1, 
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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
    Publication(
      idPublicacion: 1, 
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/6/20/asset/buzzfeed-prod-fastlane-03/sub-buzz-31580-1496794037-24.jpg?downsize=600:*&output-format=auto&output-quality=auto'
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
      titulo: 'Cerca de la UTM', 
      imagenes: [
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto',
        'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/7/19/asset/buzzfeed-prod-fastlane-02/sub-buzz-22814-1496876921-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto'
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