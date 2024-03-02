
class User {
  final int idUser;
  final String name; //Necesario
  final String email; //Necesario 
  final int? userAge;
  final String? lastName;
  final String? description;
  final int? phoneNumber;
  final String? profilePhotoUrl;
  final int? gender;
  // final List<RentalHouse>? rentalHouses;

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
    // required this.rentalHouses
    });

}
