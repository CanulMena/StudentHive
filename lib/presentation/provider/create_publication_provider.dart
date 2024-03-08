import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePublicationProvider extends ChangeNotifier {


//* desde mi pantalla guardaré todos los datos que necesito para crear publicaciones. 

  // --Price--
  int price = 0;

  // --Descripiton--
  String description = '';

  // --TitleRentalHouse--
  String title = '';

  // --AddPhotos--
  final List<XFile> _imageFileList = [];

  List<XFile> get getListXFile => _imageFileList;

  setListXFile(XFile xfile){
    _imageFileList.add(xfile);
    notifyListeners();
  }

  deleteListXFile(int index){
    _imageFileList.removeAt(index);
    notifyListeners();
  }

  deleteAllFiles(){
    _imageFileList.clear();
    notifyListeners();
  }

  getImageFile(int index){
    // if(_imageFileList[index] != null){
      return _imageFileList[index];
    // }
    // return null;
  }


  // --HouseServices--
  bool wifi = false;
  bool kitchen = false;
  bool washer = false;
  bool airConditioning = false;
  bool water = false;
  bool gas = false;
  bool television = false;

  // --TypeOfSpace--
  String typeHouseRental= '';

  // --WhoElse--
  bool mine = false;
  bool myFamily = false;
  bool friends = false;
  bool rommies = false; 

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
  // void addPublication(RentalHouse newPublication) {
  //   publications.add(newPublication);
  //   notifyListeners();
  // }

}







