import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/providers.dart';

final userDetailProvider = StateNotifierProvider<UserDetailNotifier, Map<String, dynamic>>((ref) {
  final userDetail = ref.watch(usersRepositoryProvider).getUserById;
  return UserDetailNotifier(
    getUserDetail: userDetail
  );
});

/*
  {
    '5023' : User() - instancia de user;
    '5024' : User() - instancia de user;
    '5025' : User() - instancia de user;
  }
 */

typedef GetUserDetailCallBack = Future<User> Function(int);

class UserDetailNotifier extends StateNotifier<Map<String, dynamic>> {
  final GetUserDetailCallBack getUserDetail;
  UserDetailNotifier({ required this.getUserDetail }) : super({});

  Future<void> loadUserDetail( String idUser ) async {
    if(state[idUser] != null) return; //* Si ya existe no tenemos que volver a agregarlo al mapa de usuarios
    final user = await getUserDetail(int.parse(idUser));
    state = {...state, idUser: user}; // <-- Aquí se agrega al mapa de usuarios
  }



}