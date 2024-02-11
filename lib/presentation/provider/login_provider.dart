import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/user.dart';

class LoginProvider extends ChangeNotifier {

  User? currentUser;

  final List<User> users =  [
    User(
      userAge: '9', 
      email: 'gusssy12@gmail.com', 
      password: 'aaasssddd', 
      name: 'Gustavo', 
      lastName: 'Canul')
  ];

  void addUser( String name, String lastName, String age, String email, String password){
    final User user = User(
      userAge: age, 
      email: email, 
      password: password, 
      name: name, 
      lastName: lastName, 
      );
    users.add(user);
  }

  bool loginUser(String email, String password) {
    // Busca un usuario con el correo electrónico proporcionado
    for (var user in users) {
      if (user.email == email && user.password == password) {
        // Si se encuentra un usuario y la contraseña coincide, el inicio de sesión es exitoso
        currentUser = user;
        return true;
      }
    }
    // Si no se encontró el usuario o la contraseña no coincide, el inicio de sesión falla
    return false;
  }
}