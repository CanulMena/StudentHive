import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/config/menu/menu_item.dart';

class AcountView extends StatelessWidget {
  const AcountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
      );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem,});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(

      title: Text(
        menuItem.title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400
          ),
        ),

      leading: Icon(
        menuItem.icon,
        color: Colors.blueGrey,
        ),

      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
        ),

      onTap: () {
        context.go(menuItem.linkRoute);
      },
    );
  }
}