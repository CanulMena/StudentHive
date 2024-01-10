import 'package:flutter/material.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/logged_menu_items.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/not_logged_menu_items.dart';

class AcountView extends StatelessWidget {
  const AcountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: isLogged ? const LoggedAppMenuItems() : const NoLoggedMenuItems()
        
      ),
    );
  }
}

