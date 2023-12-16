import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class ReserveProvider extends ChangeNotifier{
  
  List<Publication> listReservation = [];

  void addReservation( Publication reservation){
    listReservation.add(reservation);
  }

  void deleteReservation(Publication reservation){
    listReservation.remove(reservation);
    notifyListeners();
  }

}