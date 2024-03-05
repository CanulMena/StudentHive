class RentalHouse {
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
  final HouseImage image;

  RentalHouse({
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
    required this.image,
  });

  factory RentalHouse.fromJson(Map<String, dynamic> json) {
    return RentalHouse(
      idPublication: json['idPublication'],
      title: json['title'],
      description: json['description'],
      whoElse: json['whoElse'],
      rentPrice: json['rentPrice'],
      typeHouse: json['typeHouse'],
      idUser: json['idUser'],
      publicationDate: DateTime.parse(json['publicationDate']),
      houseService: HouseService.fromJson(json['houseService']),
      location: Location.fromJson(json['location']),
      rentalHouseDetail: RentalHouseDetail.fromJson(json['rentalHouseDetail']),
      image: HouseImage.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPublication': idPublication,
      'title': title,
      'description': description,
      'whoElse': whoElse,
      'rentPrice': rentPrice,
      'typeHouse': typeHouse,
      'idUser': idUser,
      'publicationDate': publicationDate.toIso8601String(),
      'houseService': houseService.toJson(),
      'location': location.toJson(),
      'rentalHouseDetail': rentalHouseDetail.toJson(),
      'image': image.toJson(),
    };
  }
}

class Location {
  final int idLocation;
  final String address;
  final String city;
  final String state;
  final String country;
  final int postalCode;
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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      idLocation: json['idLocation'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      neighborhood: json['neighborhood'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idLocation': idLocation,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'neighborhood': neighborhood,
    };
  }
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

  factory HouseService.fromJson(Map<String, dynamic> json) {
    return HouseService(
      idHouseService: json['idHouseService'],
      wifi: json['wifi'],
      kitchen: json['kitchen'],
      washer: json['washer'],
      airConditioning: json['airConditioning'],
      water: json['water'],
      gas: json['gas'],
      television: json['television'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idHouseService': idHouseService,
      'wifi': wifi,
      'kitchen': kitchen,
      'washer': washer,
      'airConditioning': airConditioning,
      'water': water,
      'gas': gas,
      'television': television,
    };
  }
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

  factory RentalHouseDetail.fromJson(Map<String, dynamic> json) {
    return RentalHouseDetail(
      idRentalHouseDetail: json['idRentalHouseDetail'],
      numberOfGuests: json['numberOfGuests'],
      numberOfBathrooms: json['numberOfBathrooms'],
      numberOfRooms: json['numberOfRooms'],
      numbersOfBed: json['numbersOfBed'],
      numberOfHammocks: json['numberOfHammocks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRentalHouseDetail': idRentalHouseDetail,
      'numberOfGuests': numberOfGuests,
      'numberOfBathrooms': numberOfBathrooms,
      'numberOfRooms': numberOfRooms,
      'numbersOfBed': numbersOfBed,
      'numberOfHammocks': numberOfHammocks,
    };
  }
}

class HouseImage {
  final int idImage;
  final String urlImageHouse;
  
  HouseImage({
    required this.idImage,
    required this.urlImageHouse,
  });

  factory HouseImage.fromJson(Map<String, dynamic> json) {
    return HouseImage(
      idImage: json['idImage'],
      urlImageHouse: json['urlImageHouse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idImage': idImage,
      'urlImageHouse': urlImageHouse,
    };
  }
}
