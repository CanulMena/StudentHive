import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/provider/publication/favorite_publication_provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/home/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';

class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({super.key});

  @override
  build(BuildContext context, WidgetRef ref) {

    final HomeProvider homeProvider = context.watch<HomeProvider>();
    // final FavoriteProvider favoriteProvider = context.watch<FavoriteProvider>();
    final bool isTokenAut = ref.read(isTokenAuthProvider); //*Mientras estoy en el home se lee la variable cuando se construye el widget

    List<Widget> screens = [
      PublicationsView(
        listPublications: homeProvider.publications, 
      ),
      FavoriteView( isTokenAut: isTokenAut,),
      const NotificationView(),
      const AcountView(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: homeProvider.selectedView,
        children: screens,
      ),
      bottomNavigationBar: CustomButtomNavegationBar(
          selectIndex: (value) => homeProvider.selectView(value),
          selectedIndex: homeProvider.selectedView,
          ),
    );
  }
}
