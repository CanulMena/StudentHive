
class YourRequestModel {
    final int idRequest;
    final String status;
    final RequestPublication requestPublication;

    YourRequestModel({
        required this.idRequest,
        required this.status,
        required this.requestPublication,
    });

    factory YourRequestModel.fromJson(Map<String, dynamic> json) => YourRequestModel(
        idRequest: json["idRequest"],
        status: json["status"],
        requestPublication: RequestPublication.fromJson(json["requestPublicationDto"]),
    );

    Map<String, dynamic> toJson() => {
        "idRequest": idRequest,
        "status": status,
        "requestPublication": requestPublication.toJson(),
    };
}

class RequestPublication {
    final int idPublication;
    final String title;
    final int rentPrice;
    final String images;
    final RequestUser requestUser;

    RequestPublication({
        required this.idPublication,
        required this.title,
        required this.rentPrice,
        required this.images,
        required this.requestUser,
    });

    factory RequestPublication.fromJson(Map<String, dynamic> json) => RequestPublication(
        idPublication: json["idPublication"],
        title: json["title"],
        rentPrice: json["rentPrice"],
        images: json["images"],
        requestUser: RequestUser.fromJson(json["requestUserDto"]),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "title": title,
        "rentPrice": rentPrice,
        "images": images,
        "requestUser": requestUser.toJson(),
    };
}

class RequestUser {
    final int idUser;
    final String name;
    final dynamic lastName;

    RequestUser({
        required this.idUser,
        required this.name,
        required this.lastName,
    });

    factory RequestUser.fromJson(Map<String, dynamic> json) => RequestUser(
        idUser: json["idUser"],
        name: json["name"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "name": name,
        "lastName": lastName,
    };
}
