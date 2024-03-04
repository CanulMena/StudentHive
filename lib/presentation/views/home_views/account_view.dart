import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/logged_menu_items.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/not_logged_menu_items.dart';

class AcountView extends StatelessWidget {
  const AcountView({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool isLogged = context.watch<AuthProvider>().isLogged;
    //TODO: Agregar isTokenAuth?.
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: /* isLogged ? const LoggedAppMenuItems() : */ const NoLoggedMenuItems(),
    );
  }
}

