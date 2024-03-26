
class StudentHiveDbResponse {
    final int page;
    final List<HousePreviewStudentHiveDb> results;
    final int totalPages;
    final int totalResults;

    StudentHiveDbResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory StudentHiveDbResponse.fromJson(Map<String, dynamic> json) => StudentHiveDbResponse(
        page: json["page"],
        results: List<HousePreviewStudentHiveDb>.from(json["results"].map((x) => HousePreviewStudentHiveDb.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class HousePreviewStudentHiveDb {
    final int idPublication;
    final bool status;
    final String title;
    final String nameofUser;
    final String emailUser;
    final List<String> images;
    final int rentPrice;
    final DateTime publicationDate;
    final HouseLocation houseLocation;

    HousePreviewStudentHiveDb({
        required this.idPublication,
        required this.status,
        required this.title,
        required this.nameofUser,
        required this.emailUser,
        required this.images,
        required this.rentPrice,
        required this.publicationDate,
        required this.houseLocation
    });

    factory HousePreviewStudentHiveDb.fromJson(Map<String, dynamic> json) => HousePreviewStudentHiveDb(
        idPublication: json["idPublication"],
        status: json["status"],
        title: json["title"],
        nameofUser: json["nameofUser"],
        emailUser: json["email"],
        images: List<String>.from(json["images"].map((x) => x)),
        rentPrice: json["rentPrice"],
        publicationDate: DateTime.parse(json["publicationDate"]), 
        houseLocation: HouseLocation.fromJson(json["houseLocation"]),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "title": title,
        "nameofUser": nameofUser,
        "images": List<dynamic>.from(images.map((x) => x)),
        "rentPrice": rentPrice,
        "publicationDate": publicationDate.toIso8601String(),
        "houseLocation": houseLocation.toJson(),
    };
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
        required this.neighborhood,
    });

    factory HouseLocation.fromJson(Map<String, dynamic> json) => HouseLocation(
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

