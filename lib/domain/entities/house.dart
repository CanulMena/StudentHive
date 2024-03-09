class House {
  final int idPublication;
  final String title;
  final String description;
  final String whoElse;
  final int rentPrice;
  final String typeHouse;
  final int idUser;
  final DateTime publicationDate;
  final HouseService houseService;
  final Location location;
  final RentalHouseDetail rentalHouseDetail;
  final List<String> images;

  House({
    required this.idPublication,
    required this.title,
    required this.description,
    required this.whoElse,
    required this.rentPrice,
    required this.typeHouse,
    required this.idUser,
    required this.publicationDate,
    required this.houseService,
    required this.location,
    required this.rentalHouseDetail,
    required this.images,
  });
}

class Location {
  final int idLocation;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String neighborhood;

  Location({
    required this.idLocation,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.neighborhood,
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
    required this.idHouseService,
    required this.wifi,
    required this.kitchen,
    required this.washer,
    required this.airConditioning,
    required this.water,
    required this.gas,
    required this.television,
  });
}

class RentalHouseDetail {
  final int idRentalHouseDetail;
  final int numberOfGuests;
  final int numberOfBathrooms;
  final int numberOfRooms;
  final int numbersOfBed;
  final int numberOfHammocks;

  RentalHouseDetail({
    required this.idRentalHouseDetail,
    required this.numberOfGuests,
    required this.numberOfBathrooms,
    required this.numberOfRooms,
    required this.numbersOfBed,
    required this.numberOfHammocks,
  });
}