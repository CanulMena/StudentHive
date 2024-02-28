import 'package:image_picker/image_picker.dart';

class RentalHouse {
  final int idPublication;
  final String title;
  final String description;
  final bool status;
  final List<String> images;
  final List<XFile> imagesf;
  final int rentPrice;
  final String typeHouseRental;
  final DateTime publicationDate;
  final RentalHouseDetail rentalHouseDetail;
  final HouseService houseService;
  final HouseLocation houseLocation;
  final String idUser;

  RentalHouse({
    int? idPublication,
    List<String>? images,
    List<XFile>? imagesf,
    String? idUser,
    required this.title,
    required this.description,
    required this.status,
    required this.rentPrice,
    required this.typeHouseRental,
    required this.publicationDate,
    required this.houseService,
    required this.rentalHouseDetail,
    required this.houseLocation,
  }) 
  : idPublication = idPublication ?? 1, 
  images = images ?? [],
  imagesf = imagesf ?? [],
  idUser = idUser ?? '';
}


class RentalHouseDetail {
  final int idRentalHouseDetail;
  final int numberOfGuests;
  final int numberOfBathrooms;
  final int numberOfRooms;
  final int numberOfHammocks;
  final int numberOfBedrooms;

  RentalHouseDetail({
    this.idRentalHouseDetail = 1,
    required this.numberOfGuests,
    required this.numberOfBathrooms,
    required this.numberOfRooms,
    required this.numberOfHammocks,
    this.numberOfBedrooms = 1,
    });
}

class HouseService {
  final int idHouseService;
  final bool wifi;
  final bool kitchen;
  final bool washer;
  final bool airConditioning;
  final bool water;
  final bool gas;
  final bool television;

  HouseService({
    this.idHouseService = 1,
    required this.wifi,
    required this.kitchen,
    required this.washer,
    required this.airConditioning,
    required this.water,
    required this.gas,
    required this.television
    });
}

class HouseLocation {
  final int idLocation;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String neighborhood;

  HouseLocation({
    this.idLocation = 1,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.neighborhood
    });
}
