
class Users {
    final int? idUser;
    final int? userAge;
    final String email;
    final String name;
    final String? lastName;
    final String? description;
    final int? phoneNumber;
    final String? profilePhotoUrl;
    final int? genderu;
    final int idRol;
    final List<RentalHouse> rentalHouses;

    Users({
        required this.idUser,
        required this.userAge,
        required this.email,
        required this.name,
        required this.lastName,
        required this.description,
        required this.phoneNumber,
        required this.profilePhotoUrl,
        required this.genderu,
        required this.idRol,
        required this.rentalHouses,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        idUser: json["idUser"],
        userAge: json["userAge"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        description: json["description"],
        phoneNumber: json["phoneNumber"],
        profilePhotoUrl: json["profilePhotoUrl"],
        genderu: json["genderu"],
        idRol: json["idRol"],
        rentalHouses: List<RentalHouse>.from(json["rentalHouses"].map((x) => RentalHouse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "userAge": userAge,
        "email": email,
        "name": name,
        "lastName": lastName,
        "description": description,
        "phoneNumber": phoneNumber,
        "profilePhotoUrl": profilePhotoUrl,
        "genderu": genderu,
        "idRol": idRol,
        "rentalHouses": List<dynamic>.from(rentalHouses.map((x) => x.toJson())),
    };
}

class RentalHouse {
    final int idPublication;
    final String title;
    final String description;
    final bool status;
    final dynamic idTypeReport;
    final String whoElse;
    final int rentPrice;
    final String typeHouse;
    final int idRentalHouseDetail;
    final DateTime publicationDate;
    final int idLocation;
    final int idHouseService;
    final IdHouseServiceNavigation idHouseServiceNavigation;
    final IdLocationNavigation idLocationNavigation;
    final IdRentalHouseDetailNavigation idRentalHouseDetailNavigation;
    final List<dynamic> images;

    RentalHouse({
        required this.idPublication,
        required this.title,
        required this.description,
        required this.status,
        required this.idTypeReport,
        required this.whoElse,
        required this.rentPrice,
        required this.typeHouse,
        required this.idRentalHouseDetail,
        required this.publicationDate,
        required this.idLocation,
        required this.idHouseService,
        required this.idHouseServiceNavigation,
        required this.idLocationNavigation,
        required this.idRentalHouseDetailNavigation,
        required this.images,
    });

    factory RentalHouse.fromJson(Map<String, dynamic> json) => RentalHouse(
        idPublication: json["idPublication"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        idTypeReport: json["idTypeReport"],
        whoElse: json["whoElse"],
        rentPrice: json["rentPrice"],
        typeHouse: json["typeHouse"],
        idRentalHouseDetail: json["idRentalHouseDetail"],
        publicationDate: DateTime.parse(json["publicationDate"]),
        idLocation: json["idLocation"],
        idHouseService: json["idHouseService"],
        idHouseServiceNavigation: IdHouseServiceNavigation.fromJson(json["idHouseServiceNavigation"]),
        idLocationNavigation: IdLocationNavigation.fromJson(json["idLocationNavigation"]),
        idRentalHouseDetailNavigation: IdRentalHouseDetailNavigation.fromJson(json["idRentalHouseDetailNavigation"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "title": title,
        "description": description,
        "status": status,
        "idTypeReport": idTypeReport,
        "whoElse": whoElse,
        "rentPrice": rentPrice,
        "typeHouse": typeHouse,
        "idRentalHouseDetail": idRentalHouseDetail,
        "publicationDate": publicationDate.toIso8601String(),
        "idLocation": idLocation,
        "idHouseService": idHouseService,
        "idHouseServiceNavigation": idHouseServiceNavigation.toJson(),
        "idLocationNavigation": idLocationNavigation.toJson(),
        "idRentalHouseDetailNavigation": idRentalHouseDetailNavigation.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class IdHouseServiceNavigation {
    final int idHouseService;
    final bool wifi;
    final bool kitchen;
    final bool washer;
    final bool airConditioning;
    final bool water;
    final bool gas;
    final bool television;

    IdHouseServiceNavigation({
        required this.idHouseService,
        required this.wifi,
        required this.kitchen,
        required this.washer,
        required this.airConditioning,
        required this.water,
        required this.gas,
        required this.television,
    });

    factory IdHouseServiceNavigation.fromJson(Map<String, dynamic> json) => IdHouseServiceNavigation(
        idHouseService: json["idHouseService"],
        wifi: json["wifi"],
        kitchen: json["kitchen"],
        washer: json["washer"],
        airConditioning: json["airConditioning"],
        water: json["water"],
        gas: json["gas"],
        television: json["television"],
    );

    Map<String, dynamic> toJson() => {
        "idHouseService": idHouseService,
        "wifi": wifi,
        "kitchen": kitchen,
        "washer": washer,
        "airConditioning": airConditioning,
        "water": water,
        "gas": gas,
        "television": television,
    };
}

class IdLocationNavigation {
    final int idLocation;
    final String address;
    final String city;
    final String state;
    final String country;
    final int postalCode;
    final String neighborhood;

    IdLocationNavigation({
        required this.idLocation,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.postalCode,
        required this.neighborhood,
    });

    factory IdLocationNavigation.fromJson(Map<String, dynamic> json) => IdLocationNavigation(
        idLocation: json["idLocation"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postalCode"],
        neighborhood: json["neighborhood"],
    );

    Map<String, dynamic> toJson() => {
        "idLocation": idLocation,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "postalCode": postalCode,
        "neighborhood": neighborhood,
    };
}

class IdRentalHouseDetailNavigation {
    final int idRentalHouseDetail;
    final int numberOfGuests;
    final int numberOfBathrooms;
    final int numberOfRooms;
    final int? numbersOfBed;
    final int numberOfHammocks;

    IdRentalHouseDetailNavigation({
        required this.idRentalHouseDetail,
        required this.numberOfGuests,
        required this.numberOfBathrooms,
        required this.numberOfRooms,
        required this.numbersOfBed,
        required this.numberOfHammocks,
    });

    factory IdRentalHouseDetailNavigation.fromJson(Map<String, dynamic> json) => IdRentalHouseDetailNavigation(
        idRentalHouseDetail: json["idRentalHouseDetail"],
        numberOfGuests: json["numberOfGuests"],
        numberOfBathrooms: json["numberOfBathrooms"],
        numberOfRooms: json["numberOfRooms"],
        numbersOfBed: json["numbersOfBed"],
        numberOfHammocks: json["numberOfHammocks"],
    );

    Map<String, dynamic> toJson() => {
        "idRentalHouseDetail": idRentalHouseDetail,
        "numberOfGuests": numberOfGuests,
        "numberOfBathrooms": numberOfBathrooms,
        "numberOfRooms": numberOfRooms,
        "numbersOfBed": numbersOfBed,
        "numberOfHammocks": numberOfHammocks,
    };
}
