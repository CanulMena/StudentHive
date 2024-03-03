import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isTokenAuthProvider = StateNotifierProvider<AuthNotifier,bool>((ref){
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool>{
  AuthNotifier() : super( false );
  
  Future<void> isTokenAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    int? tokenTimestamp = prefs.getInt('token_timestamp');

    if(token != null && tokenTimestamp != null) {
      //* Compara la fecha actual con la fecha de expiración del token
      DateTime now = DateTime.now();
      DateTime tokenExpiration = DateTime.fromMillisecondsSinceEpoch(tokenTimestamp);
      if (now.isBefore(tokenExpiration.add(const Duration(days: 1)))) {
        state = true;
      } else {
        //* Token expirado, eliminar el token
        await prefs.remove('token');
        await prefs.remove('token_timestamp');
      }
    }
  state = false;
  }
}