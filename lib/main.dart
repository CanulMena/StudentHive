import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/config/themes/theme_app.dart';

void main(){
  runApp(
    const ProviderScope(child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: router,
      title: 'StudentHive',
      theme: ThemesApp().themes(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}