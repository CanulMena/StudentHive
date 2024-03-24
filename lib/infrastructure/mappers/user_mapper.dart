import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';

class UserMapper {
  static User userToEntity(UserModel user) => User(
        idUser: user.idUser,
        name: user.name,
        email: user.email,
        userAge: user.userAge,
        lastName: user.lastName,
        description: user.description,
        phoneNumber: user.phoneNumber,
        profilePhotoUrl: user.profilePhotoUrl,
        gender: user.genderu,
        idRol: user.idRol,
      );

  static UserModel entityToUser(User user) => UserModel(
      idUser: user.idUser,
      userAge: user.userAge,
      email: user.email,
      name: user.name,
      lastName: user.lastName,
      description: user.description,
      phoneNumber: user.phoneNumber,
      profilePhotoUrl: user.profilePhotoUrl,
      genderu: user.gender,
      idRol: user.idRol ?? 1
      );
}
