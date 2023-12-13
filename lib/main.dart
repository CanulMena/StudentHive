import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/config/themes/theme_app.dart';
import 'package:studenthive/infrastructure/datasource/publication_datasource_impl.dart';
import 'package:studenthive/infrastructure/repositories/publication_repositories_impl.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/home/home_screen.dart';
import 'package:studenthive/presentation/screens/login/login_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider(
          publicationRepositoriesImpl: PublicationRepositoriesImpl(
            publicationDataSourceImpl: PublicationDataSourceImpl())
            )..getPublications())
      ],
      child: MaterialApp(
        title: 'StudentHive',
        home: const HomeScreen(),
        theme: ThemesApp(selectColor: 1).themes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 