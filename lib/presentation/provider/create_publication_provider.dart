import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class CreatePublicationProvider extends ChangeNotifier {

  List<Publication> publications = []; //TODO: This list will add new data to the publication list from HomeScreen

//* desde mi pantalla guardaré todos los datos que necesito para crear publicaciones. 


  // --TypeOfSpace--
  String typeOfSpace = '';

  // --WhoElse--

  // --Location--
  String country = '';
  String postalCode = '';
  String state = '';
  String city = '';
  String address = '';
  String neighborhood = '';

  // --HouseDetail--
  int guests = 0;
  int rooms = 0;
  int beeds = 0;
  int hammocks = 0;
  int batrooms = 0;

  void incrementGuests() {
    guests++;
    notifyListeners();
  }

  void incrementRoom() {
    rooms++;
    notifyListeners();
  }

  void incrementBed() {
    beeds++;
    notifyListeners();
  }

  void incrementHammock() {
    hammocks++;
    notifyListeners();
  }

  void incrementBatroom() {
    batrooms++;
    notifyListeners();
  }

  void decrementGuests() {
    guests = guests > 0 ? guests - 1 : 0;
    notifyListeners();
  }

  void decrementRoom() {
    rooms = rooms > 0 ? rooms - 1 : 0;
    notifyListeners();
  }

  void decrementBed() {
    beeds = beeds > 0 ? beeds - 1 : 0;
    notifyListeners();
  }

  void decrementHammock() {
    hammocks = hammocks > 0 ? hammocks - 1 : 0;
    notifyListeners();
  }

  void decrementBatroom() {
    batrooms = batrooms > 0 ? batrooms - 1 : 0;
    notifyListeners();
  }
  
  //*Add new publication.
  void addPublication(Publication newPublication) {
    publications.add(newPublication);
    notifyListeners();
  }

}







