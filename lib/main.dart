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

  void _initializeTokenAuth() { //! No entiendo esta parte del codigo - me la dio chat
    ref.read(isTokenAuthProvider.notifier).isTokenAuth().then((_) {
      // Aquí puedes realizar acciones adicionales después de que isTokenAuth haya terminado
      // Por ejemplo, actualizar el estado o redibujar el widget si es necesario
      setState(() {}); //*Esto solo es para escuchar al provider que ha cambaido su valor.
    });
  }

  @override
  Widget build(BuildContext context) {

    final isTokenAut = ref.read(isTokenAuthProvider);
    final MyRoute myRoute = MyRoute(isTokenAut: isTokenAut);

    return MaterialApp.router(
      routerConfig: myRoute.router(),
      title: 'StudentHive',
      theme: ThemesApp().themes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
