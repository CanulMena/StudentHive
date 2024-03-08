// To parse this JSON data, do
//
//     final houseDetails = houseDetailsFromJson(jsonString);

import 'dart:convert';

HouseDetails houseDetailsFromJson(String str) => HouseDetails.fromJson(json.decode(str));

String houseDetailsToJson(HouseDetails data) => json.encode(data.toJson());

class HouseDetails {
    final int idPublication;
    final int idUser;
    final String title;
    final String description;
    final bool status;
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
    final List<String> images;

    HouseDetails({
        required this.idPublication,
        required this.idUser,
        required this.title,
        required this.description,
        required this.status,
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

    factory HouseDetails.fromJson(Map<String, dynamic> json) => HouseDetails(
        idPublication: json["idPublication"],
        idUser: json["idUser"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
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
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "idUser": idUser,
        "title": title,
        "description": description,
        "status": status,
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
    final String postalCode;
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
    final int numberOfHammocks;

    IdRentalHouseDetailNavigation({
        required this.idRentalHouseDetail,
        required this.numberOfGuests,
        required this.numberOfBathrooms,
        required this.numberOfRooms,
        required this.numberOfHammocks,
    });

    factory IdRentalHouseDetailNavigation.fromJson(Map<String, dynamic> json) => IdRentalHouseDetailNavigation(
        idRentalHouseDetail: json["idRentalHouseDetail"],
        numberOfGuests: json["numberOfGuests"],
        numberOfBathrooms: json["numberOfBathrooms"],
        numberOfRooms: json["numberOfRooms"],
        numberOfHammocks: json["numberOfHammocks"],
    );

    Map<String, dynamic> toJson() => {
        "idRentalHouseDetail": idRentalHouseDetail,
        "numberOfGuests": numberOfGuests,
        "numberOfBathrooms": numberOfBathrooms,
        "numberOfRooms": numberOfRooms,
        "numberOfHammocks": numberOfHammocks,
    };
}
