import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/auth_provider.dart';
import 'package:studenthive/presentation/screens/screens.dart';

 // Función para obtener el estado de isLogged desde SharedPreferences

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        final authProvider = Provider.of<AuthProvider>(context);
        if(authProvider.isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
        return authProvider.isLogged ? const HomeScreen() : const LoginScreen();
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
        final RentalHouse publicationPost = GoRouterState.of(context).extra! as RentalHouse;
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
