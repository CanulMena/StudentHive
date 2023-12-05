import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/config/themes/theme_app.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/publication/publications_home_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()..nextPublication())
      ],
      child: MaterialApp(
        title: 'StudentHive',
        home: const PublicationHomeScreen(),
        theme: ThemesApp(selectColor: 1).themes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}