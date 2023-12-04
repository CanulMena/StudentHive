import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/screens/widgets/custom_appbar.dart';
import 'package:studenthive/presentation/views/acount_view.dart';
import 'package:studenthive/presentation/views/favorites_view.dart';
import 'package:studenthive/presentation/views/notificatino_view.dart';
import 'package:studenthive/presentation/views/publication_view.dart';

class PublicationHomeScreen extends StatelessWidget {
  const PublicationHomeScreen({super.key});

  @override
   build(BuildContext context) {

    final homeProvider = context.watch<HomeProvider>();
    List<Widget> screens = [
    PublicationView( listPublicationProvider: homeProvider.publications,),
    const NotificationView(),
    const AcountView(),
    const FavoriteView()
  ];
    
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar().build(context),

        body: IndexedStack(
          index: homeProvider.selectedIndex,//*El numero de index al que vamos a acceder
          children: screens, //*Esta propiedad nos pide las listas a las que accederemos con la propiedad de index.
        ),

        bottomNavigationBar: const CustomBottom(),
      ),
    );
  }
}

