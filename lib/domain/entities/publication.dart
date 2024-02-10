class Publication {
  final int idPublication;
  final String title;
  final String description;
  final bool status;
  final List<String> images;
  final int rentPrice;
  final DateTime publicationDate;
  final RentalHouseDetail rentalHouseDetail;
  final TypeHouseRental typeHouseRental;
  final HouseLocation houseLocation;
  final String idUser;

  Publication({
    required this.idPublication,
    required this.title,
    required this.description,
    required this.images,
    required this.status,
    required this.rentPrice,
    required this.publicationDate,
    required this.rentalHouseDetail,
    required this.typeHouseRental,
    required this.houseLocation,
    required this.idUser,
  });
}

class RentalHouseDetail {
  final int idRentalHouseDetail;
  final int numberOfGuests;
  final int numberOfBathrooms;
  final int numberOfRooms;
  final int numberOfHammocks;

  RentalHouseDetail({
    required this.idRentalHouseDetail,
    required this.numberOfGuests,
    required this.numberOfBathrooms,
    required this.numberOfRooms,
    required this.numberOfHammocks
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
    required this.television
    });
}

class TypeHouseRental {
  final int idTypeHouseRental;
  final bool ownHouse;
  final bool sharedRoom;
  final bool singleRoom;

  TypeHouseRental({
    required this.idTypeHouseRental,
    required this.ownHouse,
    required this.sharedRoom,
    required this.singleRoom
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
    required this.idLocation,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.neighborhood
    });
}
