
class User {
  final int idUser;
  final String name;
  final String email; 
  final int? userAge;
  final String? lastName;
  final String? description;
  final int? phoneNumber;
  final String? profilePhotoUrl;
  final int? gender;
  final int? idRol;

  User({
    required this.idUser,
    required this.name,
    required this.email,
    required this.userAge,
    required this.lastName,
    required this.description,
    required this.phoneNumber,
    required this.profilePhotoUrl,
    required this.gender,
    required this.idRol,
  });

  // addUser({required int userAge, required String name, required String lastName, required String description, required int phoneNumber, required int gender, required String profilePhotoUrl}) {}

}
