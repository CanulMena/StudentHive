import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class ReserveProvider extends ChangeNotifier{
  
  List<Publication> listReservation = [];

  void addReservation( Publication reservation){
    if (!containsReservation(reservation)) {
      listReservation.add(reservation);
      notifyListeners();
    }
  }

  void deleteReservation(Publication reservation){
    listReservation.remove(reservation);
    notifyListeners();
  }

  bool containsReservation(Publication reservation) {
    return listReservation.any((e) => reservation.idPublicacion == e.idPublicacion);
  }

} 