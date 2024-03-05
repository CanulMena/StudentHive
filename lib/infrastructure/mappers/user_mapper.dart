import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';

class UserMapper {
  static User userToEntity(UserModel user) => User(
      idUser: user.idRol,
      name: user.name,
      email: user.email,
      userAge: user.userAge,
      lastName: user.lastName,
      description: user.description,
      phoneNumber: user.phoneNumber,
      profilePhotoUrl: user.profilePhotoUrl,
      gender: user.genderu,
      // rentalHouses: user.rentalHouses
      );
}
