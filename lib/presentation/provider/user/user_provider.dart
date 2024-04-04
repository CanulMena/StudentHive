import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/infrastructure/mappers/user_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';
import 'package:studenthive/presentation/provider/user/user_respository_provider.dart';
//*Provider, StateProvider, StateNotiferProvider, ChangeNotifierProvider, SreamNotifier... 

final createUserSesionProvider = Provider((ref) => ref.watch(usersRepositoryProvider).postUser);

final loginUserProvider = Provider((ref) => ref.watch(usersRepositoryProvider).loginUser);

final userCreateProfileProvider = Provider((ref) => ref.watch(usersRepositoryProvider).putUserAccount);

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref){
  final userGetByEmailProvider = ref.watch(usersRepositoryProvider).getUserByEmail;
  return UserNotifier( userGetByEmailProvider );
});


class UserNotifier extends StateNotifier<User?> {
  final Future<User> Function(String) userGetByEmailProvider;
  UserNotifier(this.userGetByEmailProvider) : super(null);

  Future<void> loadUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      UserModel userModel = UserModel.fromJson(userMap);
      User userState = UserMapper.userToEntity(userModel);
      state = userState;
    }
  }

  Future<void> setUser(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final User user = await userGetByEmailProvider(email);

    
    UserModel userModel = UserMapper.entityToUser(user);
    Map<String, dynamic> userModelMap = userModel.toJson();
    String userModelJson = jsonEncode(userModelMap);

    if(userModelJson != prefs.getString('user')){ // si no es el mismo string del usuario procede a guardarse
      prefs.setString('user', userModelJson);
    }
  }

  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    state = null;
  }

  // Fetch para crear un perfil (update a user)
  // Future<void> updateUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString('user');
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     UserModel userModel = UserModel.fromJson(userMap);
  //     User userState = UserMapper.userToEntity(userModel);
  //     state = userState;
  //   }
  // }
}