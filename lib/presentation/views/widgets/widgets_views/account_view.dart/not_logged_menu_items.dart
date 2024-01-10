import 'package:flutter/material.dart';
import 'package:studenthive/config/menu/menu_item.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/custom_list_tile.dart';

class NoLoggedMenuItems extends StatelessWidget {
  const NoLoggedMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            
            const SizedBox(height: 50,),
            
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
                ),
              ),

            const SizedBox(height: 15,),
          
            ...noLoggedMenuItems.map((menuItem) => CustomListTile(menuItem: menuItem)),
          
          ],
        );
  }
}