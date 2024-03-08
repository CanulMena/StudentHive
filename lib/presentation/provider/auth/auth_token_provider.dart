import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isTokenAuthProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false) {//inicializamos el estado siempre en false
    isTokenAuth(); //* Modificamos el estado del AuthNotifier cuando se cree la instancia de AuthNotifier. --> esto es por que el estado de AuthNotifier esta inicializado como false. 
  }

  Future<void> isTokenAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('Jwt');
    int? tokenTimestamp = prefs.getInt('token_timestamp'); 

    if (token != null && tokenTimestamp != null) {
      //* Compara la fecha actual con la fecha de expiración del token
      DateTime now = DateTime.now();
      DateTime tokenExpiration =
          DateTime.fromMillisecondsSinceEpoch(tokenTimestamp);
      if (now.isBefore(tokenExpiration.add(const Duration(days: 1)))) {
        state = true;
        return; // *Sale de la función si el token es válido <-- Por esta puta madre no me estaba agarrando el puto codigo
      } else {
        //* Token expirado, eliminar el token
        await prefs.remove('Jwt');
        await prefs.remove('token_timestamp');
      }
    }
    state = false; //*No se encontró algún token o el token_timestamp es invalido
  }

  Future<void> desavowToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('Jwt');
    await prefs.remove('token_timestamp');
    state = false;
  }
}
