import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/logged_menu_items.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/not_logged_menu_items.dart';

class AcountView extends StatefulWidget {
  const AcountView({super.key});

  @override
  State<AcountView> createState() => _AcountViewState();
}

class _AcountViewState extends State<AcountView> {
  bool isLogged = false; // Variable para almacenar el estado de isLogged

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Verificar el estado de inicio de sesión al iniciar
  }

  // Método para verificar el estado de inicio de sesión
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isUserLogged = prefs.getBool('isLogged');
    setState(() {
      isLogged = isUserLogged ?? false; // Actualizar el estado de isLogged
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: isLogged ? const LoggedAppMenuItems() : const NoLoggedMenuItems(),
    );
  }
}

