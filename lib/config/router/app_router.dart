import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/screens.dart';

bool isLogged = false;

final GoRouter router = GoRouter(
  
  initialLocation: isLogged ? '/home' : '/login',
  
  routes: <RouteBase>[
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

