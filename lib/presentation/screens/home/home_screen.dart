import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/shared/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
   build(BuildContext context) {

    final homeProvider = context.watch<HomeProvider>();

    List<Widget> screens = [
    PublicationView( listPublicationProvider: homeProvider.publications,),
    const NotificationView(),
    const FavoriteView(),
    const AcountView(),
  ];
    
    return Scaffold(
      appBar: _CustomAppBar().build(context),

      body: IndexedStack(//! Aprender el nombre de este widget
        index: homeProvider.selectedIndex,//*El numero de index al que vamos a acceder
        children: screens, //*Esta propiedad nos pide las listas a las que accederemos con la propiedad de index.
      ),

      bottomNavigationBar: CustomButtomNavegationBar( 
        selectIndex: (value) => homeProvider.selectView(value), 
        selectedIndex: homeProvider.selectedIndex
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