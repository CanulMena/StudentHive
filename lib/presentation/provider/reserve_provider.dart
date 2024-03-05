// import 'package:flutter/material.dart';
// import 'package:studenthive/domain/entities/rentalhouse.dart';

// class ReserveProvider extends ChangeNotifier{
  
//   List<RentalHouse> listReservation = [];

//   void addReservation( RentalHouse reservation){
//     if (!containsReservation(reservation)) {
//       listReservation.add(reservation);
//       notifyListeners();
//     }
//   }

//   void deleteReservation(RentalHouse reservation){
//     listReservation.remove(reservation);
//     notifyListeners();
//   }

//   bool containsReservation(RentalHouse reservation) {
//     return listReservation.any((e) => reservation.idPublication == e.idPublication);
//   }

// } 