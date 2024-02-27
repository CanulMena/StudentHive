import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/home/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  build(BuildContext context) {

    final HomeProvider homeProvider = context.watch<HomeProvider>();
    final FavoriteProvider favoriteProvider = context.watch<FavoriteProvider>();

    List<Widget> screens = [
      PublicationsView(
        listPublications: homeProvider.publications, 
      ),
      FavoriteView(favoriteProvider: favoriteProvider, ),
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
