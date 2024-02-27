import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/config/menu/menu_item.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.menuItem,});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(

      contentPadding: EdgeInsets.zero,

      title: Text(
        menuItem.title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400
          ),
        ),

      leading: Icon(
        menuItem.icon,
        color: Colors.black54,
        ),

      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
        ),

      onTap: () {
        context.push(menuItem.linkRoute);
      },

      tileColor: Colors.transparent,

      shape: const Border(
        bottom: BorderSide(
          color: Color.fromARGB(255, 201, 197, 197),
          width: 0.75
        )

      ),
    );
  }
}