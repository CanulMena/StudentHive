import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/screens/screens.dart';

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
            final isLoading = ref.read(isTokenAuthProvider.notifier).isLoading;
            if( isLoading ) return const Scaffold( body: Center( child: CircularProgressIndicator(),),);
            return isTokenAuth ? const HomeScreen() : const LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'house/:id',
              builder: (context, state){
                final houseId = state.pathParameters['id'] ?? 'no-id';
                return PublicationScreen(idHouse: houseId);
              }
            )
          ]
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
        // GoRoute(
        //   path: '/publication',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return PublicationScreen();
        //   },
        // ),
        // GoRoute(
        //   path: '/reserve',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ReserveScreen();
        //   },
        // ),
        GoRoute(
            path: '/createPublication',
            builder: (BuildContext context, GoRouterState state) {
              return const CreatePublicationInit();
            })
      ],
    );
  }
}
