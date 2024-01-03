import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/screens.dart';

final GoRouter router = GoRouter(

  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },      
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },      
    ),
    GoRoute(
      path: '/publication',
      builder: (BuildContext context, GoRouterState state) {
        final Publication publicationPost = GoRouterState.of(context).extra! as Publication;
        return PublicationScreen( publicationPost: publicationPost, );
      },      
    ),
    GoRoute(
      path: '/reserve',
      builder: (BuildContext context, GoRouterState state) {
        return const ReserveScreen();
      },      
    ),
  ],
);  

