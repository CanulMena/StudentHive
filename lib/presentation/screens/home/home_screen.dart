import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/home/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
   build(BuildContext context) {

    final homeProvider = context.watch<HomeProvider>();

    List<Widget> screens = [
    PublicationsView( listPublicationProvider: homeProvider.publications,),
    const NotificationView(),
    const FavoriteView(),
    const AcountView(),
  ];
    
    return Scaffold(
      appBar: _CustomAppBar().build(context),

      body: IndexedStack(
        index: homeProvider.selectedView,
        children: screens, 
      ),

      bottomNavigationBar: CustomButtomNavegationBar( 
        selectIndex: (value) => homeProvider.selectView(value), 
        selectedIndex: homeProvider.selectedView
        ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.search)
          ),
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
          ),
        ],
      );
  }
}