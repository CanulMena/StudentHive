import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/config/themes/theme_app.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(), 
      )
    );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {


  @override
  void initState() {
    super.initState();
    _initializeTokenAuth();
  }

  void _initializeTokenAuth() {
    ref.read(isTokenAuthProvider.notifier).isTokenAuth().then((_) {
      setState(() {}); 
    });
  }

  @override
  Widget build(BuildContext context) {
    
    MyRoute myRoute = MyRoute( ref );

    return MaterialApp.router(
      routerConfig: myRoute.router(),
      title: 'StudentHive',
      theme: ThemesApp().themes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
