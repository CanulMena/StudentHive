import 'package:flutter/material.dart';
import 'package:studenthive/config/menu/menu_item.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/custom_list_tile.dart';

class LoggedAppMenuItems extends StatelessWidget {
  const LoggedAppMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () {
                  // context.go('/notification');
                },
                icon: const Icon(
                  Icons.notifications_none,
                  size: 30,
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const _ProfileListTile(),
        const _CreatePublicationListTile(),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        ...loggedSettigMenuItems
            .map((menuItem) => CustomListTile(menuItem: menuItem)),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Legal',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        ...legalMenuItems.map((menuItem) => CustomListTile(menuItem: menuItem)),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class _CreatePublicationListTile extends StatelessWidget {
  const _CreatePublicationListTile();

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      menuItem: MenuItem(
        icon: Icons.add_home_rounded,
        title: 'Create a publication',
        linkRoute: '/createPublication',
      ),
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.person),
      title: const Text('Name profile'),
      subtitle: const Text('show profile'),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
    );
  }
}
