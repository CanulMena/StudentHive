
class UserModel {
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

    UserModel({
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
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    };
}

