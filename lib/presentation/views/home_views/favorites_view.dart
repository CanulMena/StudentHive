import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_logged.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_no_logged.dart';

class FavoriteView extends StatefulWidget {
  final FavoriteProvider favoriteProvider;

  const FavoriteView({
    super.key,
    required this.favoriteProvider,
  });

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  bool isLogged = false;
  late User currentUser;
  bool isLoading = true; // Agregar un estado de carga

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isUserLogged = prefs.getBool('isLogged');
    setState(() {
      isLogged = isUserLogged ?? false;
    });
  }

  Future<void> _loadCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      setState(() {
        currentUser = User.fromJson(userDataMap);
        isLoading = false; // Indicar que la carga ha finalizado
      });
    } else {
      currentUser = User(
          userAge: '100',
          email: 'studenthive@gmail.com',
          password: 'asdf',
          name: 'Student',
          lastName: 'Hive');
      isLoading = false; // Indicar que la carga ha finalizado
    }
  }

  @override
  void initState() {
    _checkLoginStatus();
    _loadCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Text(
                isLoading ? '' : currentUser.name, // Mostrar "Cargando..." mientras se carga
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 2.0,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        strokeWidth: 2,
        onRefresh: () {
          return Future(() {});
        },
        child: Padding(
            padding: isLogged
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 25),
            child: !isLogged
                ? const FavoriteViewNoLogged()
                : FavoriteViewLogged(
                    favoriteProvider: widget.favoriteProvider,
                    size: size,
                  )),
      ),
    );
  }
}
