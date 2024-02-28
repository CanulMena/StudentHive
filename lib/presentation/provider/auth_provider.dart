import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  bool get isLogged => _isLogged; //isLogged tomará el valor de la variable local _isLoged
  bool get isLoading => _isLoading;

  bool _isLogged = false;
  bool _isLoading = true;

  AuthProvider() {
    _loadAuthState(); //?cada vez que inica la aplicacion. El constructor del provier, consutruye las variables que neceitamos del sharedPreferences?
  }

  Future<void> _loadAuthState() async {//esta funcion se activará cuando se cree el provider al uniciar la aplciacion.
    _prefs = await SharedPreferences.getInstance();//*Tengo que asignarle un valor al _prefers para poder interacuar con sharedpreferences.
    _isLogged = _prefs.getBool('isLogged') ?? false; //*Aca agrego el isLogged del sharedpreferences .
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login() async {
    _isLogged = true;
    await _prefs.setBool('isLogged', true);
    notifyListeners();
  }

  Future<void> logout() async {
    _isLogged = false;
    await _prefs.remove('userData');//?Como remover un dato, tiene que ser una funcion asyncrona?
    await _prefs.setBool('isLogged', false); //?Como agregar un dato. Tiene que tener una fucion asyncrona?
    notifyListeners();
  }
}
