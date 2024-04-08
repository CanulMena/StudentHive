

class MyRequestModel {
    final int idRequest;
    final String status;
    final UserRequestDto userRequestDto;

    MyRequestModel({
        required this.idRequest,
        required this.status,
        required this.userRequestDto,
    });

    factory MyRequestModel.fromJson(Map<String, dynamic> json) => MyRequestModel(
        idRequest: json["idRequest"],
        status: json["status"],
        userRequestDto: UserRequestDto.fromJson(json["userRequestDto"]),
    );

    Map<String, dynamic> toJson() => {
        "idRequest": idRequest,
        "status": status,
        "userRequestDto": userRequestDto.toJson(),
    };
}

class UserRequestDto {
    final int idUser;
    final String? profilePhotoUrl;
    final String name;
    final String? lastName;

    UserRequestDto({
        required this.idUser,
        required this.profilePhotoUrl,
        required this.name,
        required this.lastName,
    });

    factory UserRequestDto.fromJson(Map<String, dynamic> json) => UserRequestDto(
        idUser: json["idUser"],
        profilePhotoUrl: json["profilePhotoUrl"],
        name: json["name"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "profilePhotoUrl": profilePhotoUrl,
        "name": name,
        "lastName": lastName,
    };
}
