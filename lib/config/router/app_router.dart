import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/screens/screens.dart';
import 'package:studenthive/presentation/views/home_views/profile_view.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/steps_for_creation_publication/type_house.dart';

class MyRoute {
  final WidgetRef ref;

  MyRoute(this.ref);

  RouterConfig<Object>? router() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
            path: '/',
            builder: (context, state) {
              final isTokenAuth = ref.read(isTokenAuthProvider);
              // final isLoading = ref.read(isTokenAuthProvider.notifier).isLoading;
              // if( isLoading ) return const Scaffold( body: Center( child: CircularProgressIndicator(),),);
              return isTokenAuth ? const HomeScreen() : const LoginScreen();
            },
            routes: [
              GoRoute(
                  path: 'house/:id',
                  builder: (context, state) {
                    final houseId = state.pathParameters['id'] ?? 'no-id';
                    return PublicationScreen(idHouse: houseId);
                  }),
              GoRoute(
                  path: 'create-publication',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CreatePublicationInit();
                  },
                  routes: [
                    GoRoute(
                        path: 'type-house',
                        builder: (BuildContext context, GoRouterState state) {
                          return const TypeHouse();
                        })
                  ])
            ]),
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
          path: '/profile',
          builder: (context, state) {
            return const ProfileView();
          },
        ),
      ],
    );
  }
}
