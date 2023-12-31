import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/config/themes/theme_app.dart';
import 'package:studenthive/infrastructure/datasource/publication_datasource_impl.dart';
import 'package:studenthive/infrastructure/repositories/publication_repositories_impl.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/provider/reserve_provider.dart';

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
            )/* ..getPublications() */),
            
        ChangeNotifierProvider(create: (context) => ReserveProvider(),),

        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'StudentHive',
        theme: ThemesApp(selectedColor: 1).themes(),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
} 