import 'package:flutter/material.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/provider/login_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_logged.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/favorites_view/favorite_view_no_logged.dart';

class FavoriteView extends StatelessWidget {
  final LoginProvider loginProvider;
  final FavoriteProvider favoriteProvider;

  const FavoriteView({super.key, required this.favoriteProvider, required this.loginProvider});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = loginProvider.currentUser ?? User(userAge: '', email: '', password: '', name: '', lastName: '');

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
                user.name,
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
          child: !isLogged ? const FavoriteViewNoLogged() : FavoriteViewLogged(favoriteProvider: favoriteProvider, size: size,)
        ),
      ),
    );
  }
}

