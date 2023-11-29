import 'package:flutter/material.dart';
import 'package:studenthive/config/themes/theme_app.dart';
import 'package:studenthive/presentation/screens/publication/landlordhouse_post_screen.dart.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHive',
      home: const PublicationScreen(),
      theme: ThemesApp(selectColor: 0).themes(),
      debugShowCheckedModeBanner: false,
    );
  }
}