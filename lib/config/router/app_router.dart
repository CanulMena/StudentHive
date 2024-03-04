import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/screens.dart';

class MyRoute {
  final bool isTokenAut;

  MyRoute({required this.isTokenAut});

  RouterConfig<Object>? router() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) {
            return isTokenAut ? const HomeScreen() : const LoginScreen();
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: '/createAccount',
          builder: (context, state) {
            return const CreateAnAccountScreen();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/publication',
          builder: (BuildContext context, GoRouterState state) {
            final RentalHouse publicationPost =
                GoRouterState.of(context).extra! as RentalHouse;
            return PublicationScreen(
              publicationPost: publicationPost,
            );
          },
        ),
        GoRoute(
          path: '/reserve',
          builder: (BuildContext context, GoRouterState state) {
            return const ReserveScreen();
          },
        ),
        GoRoute(
            path: '/createPublication',
            builder: (BuildContext context, GoRouterState state) {
              return const CreatePublicationInit();
            })
      ],
    );
  }
}
