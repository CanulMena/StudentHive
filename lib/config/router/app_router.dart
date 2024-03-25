import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/screens/screens.dart';
import 'package:studenthive/presentation/views/home_views/profile_view.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/app_steps_create_publications.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/steps_for_creation_publication/type_house.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/my_publications_view.dart';

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
                  //* Ruta para ver una publicacion
                  path: 'house/:id',
                  builder: (context, state) {
                    final houseId = state.pathParameters['id'] ?? 'no-id';
                    return PublicationScreen(idHouse: houseId);
                  }),
              GoRoute(
                  //* Ruta para crear una publicacion
                  path: 'create-publication',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CreatePublicationInit();
                  },
                  routes: [
                    GoRoute(
                        path: 'type-house',
                        builder: (BuildContext context, GoRouterState state) {
                          return const TypeHouse();
                        },
                        routes: [
                          GoRoute(
                              path: 'create-publication-steps/:typeHouseRental',
                              builder: (context, state) {
                                final typeHouseRental = state.pathParameters['typeHouseRental'] ?? 'no-type';
                                return AppStepsCreatePublications(
                                  typeHouseRental: typeHouseRental,
                                );
                              }),
                        ])
                  ]),

              GoRoute(
                path: 'view-profile',
                builder: (context, state) {
                  return const ProfileView();
                },
              ),

              GoRoute(
                path: 'my-publications',
                builder: (context, state) {
                  return const MyPublicationView();
                },
              ),
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

      ],
    );
  }
}
