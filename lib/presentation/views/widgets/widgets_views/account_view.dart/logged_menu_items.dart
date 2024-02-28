import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/config/menu/menu_item.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/custom_list_tile.dart';

class LoggedAppMenuItems extends StatelessWidget {
  const LoggedAppMenuItems({super.key});

  void openDialog(BuildContext context, AuthProvider authProvider, UserProvider userProvider) {
  showDialog( //*showDialog personalizado
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        // title: const Text('¿Estás seguro?'), //this is the title of the show dialog.
        content: const Text(
          '¿Estas seguro que quires salir de tu cuenta?',     
        ),
        actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButton(
            onPressed: () {
            context.pop();
            },
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              authProvider.logout();
              userProvider.loadCurrentUser();
              context.go('/login');
            },
            child: const Text('Aceptar'),
          ),
          ],
        )
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>(); //*Siempre que crear un provider desde un contexto directo.
    final UserProvider userProvider = context.watch<UserProvider>();
    final textStyle = Theme.of(context).textTheme;
    return ListView(
      
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: textStyle.bodyLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.w600)
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
          height: 25,
        ),
        InkWell(
          child: const Text(
            'Log Out',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
          ),
          onTap: () {
            openDialog(context, authProvider, userProvider); 
          },
        ),
        const SizedBox(height: 25,),
        _HorizontalLine()
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
        icon: Icons.home_work_outlined,
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
      leading: const Icon(Icons.person_outline),
      title: const Text('Name profile'),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Color.fromARGB(255, 201, 197, 197),
          width: 0.75
        )

      ),
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  final double height = .75;
  final Color color = const Color.fromARGB(255, 201, 197, 197);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}