import 'package:shared_preferences/shared_preferences.dart';

class Token {

  static Future<void> saveToken(String token, int dateTimeMillis ) async { 
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Jwt', token);
    await prefs.setInt('token_timestamp', dateTimeMillis);
  }

  static Future<String?> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Jwt');
  }
  

}