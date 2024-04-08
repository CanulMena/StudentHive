
class RequestModel {
    final int idRequest;
    final String status;
    final RequestPublicationDto requestPublicationDto;

    RequestModel({
        required this.idRequest,
        required this.status,
        required this.requestPublicationDto,
    });

    factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        idRequest: json["idRequest"],
        status: json["status"],
        requestPublicationDto: RequestPublicationDto.fromJson(json["requestPublicationDto"]),
    );

    Map<String, dynamic> toJson() => {
        "idRequest": idRequest,
        "status": status,
        "requestPublicationDto": requestPublicationDto.toJson(),
    };
}

class RequestPublicationDto {
    final int idPublication;
    final String title;
    final int rentPrice;
    final String images;
    final RequestUserDto requestUserDto;

    RequestPublicationDto({
        required this.idPublication,
        required this.title,
        required this.rentPrice,
        required this.images,
        required this.requestUserDto,
    });

    factory RequestPublicationDto.fromJson(Map<String, dynamic> json) => RequestPublicationDto(
        idPublication: json["idPublication"],
        title: json["title"],
        rentPrice: json["rentPrice"],
        images: json["images"],
        requestUserDto: RequestUserDto.fromJson(json["requestUserDto"]),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "title": title,
        "rentPrice": rentPrice,
        "images": images,
        "requestUserDto": requestUserDto.toJson(),
    };
}

class RequestUserDto {
    final int idUser;
    final String name;
    final String? lastName;

    RequestUserDto({
        required this.idUser,
        required this.name,
        required this.lastName,
    });

    factory RequestUserDto.fromJson(Map<String, dynamic> json) => RequestUserDto(
        idUser: json["idUser"],
        name: json["name"],
        lastName: json["lastName"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "name": name,
        "lastName": lastName,
    };
}
