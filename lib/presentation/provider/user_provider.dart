import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late User currentUser = User(
      userAge: '0',
      email: 'studenthive@gmail.com',
      password: 'asdf1234',
      name: 'studenthive',
      lastName: '');

  bool isLoading = true; // Agregar un estado de carga

  UserProvider() {
    loadCurrentUser();
  }

  final List<User> users = [
    User(
        userAge: '9',
        email: 'gusssy12@gmail.com',
        password: 'aaasssddd',
        name: 'Gustavo',
        lastName: 'Canul')
  ];

  void addUser(String name, String lastName, String age, String email, String password) {
    final User user = User(
      userAge: age,
      email: email,
      password: password,
      name: name,
      lastName: lastName,
    );
    users.add(user);
  }

  User? loginUser(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }

  Future<void> removeCurrentUser() async {
    await _prefs.remove('userData');
  }

  Future<void> addCurrentuser( String userJson) async {
    await _prefs.setString('userData', userJson);
    loadCurrentUser();
    notifyListeners();
  }

  Future<void> loadCurrentUser() async {
    _prefs = await SharedPreferences.getInstance();
    String? userDataJson = _prefs.getString('userData');
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      currentUser = User.fromJson(userDataMap);
    } else {
      currentUser = User(
      userAge: '0',
      email: 'studenthive@gmail.com',
      password: 'asdf1234',
      name: 'studenthive',
      lastName: '');
    }
    isLoading = false;
    notifyListeners();
  }
}
