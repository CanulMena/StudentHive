import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/shared/widgets/custom_appbar.dart';
import 'package:studenthive/presentation/views/acount_view.dart';
import 'package:studenthive/presentation/views/favorites_view.dart';
import 'package:studenthive/presentation/views/publication_home_view.dart';
import 'package:studenthive/presentation/views/notificatino_view.dart';

class PublicationHomeScreen extends StatefulWidget {
  const PublicationHomeScreen({super.key});

  @override
  State<PublicationHomeScreen> createState() => _PublicationHomeScreenState();
}

class _PublicationHomeScreenState extends State<PublicationHomeScreen> {
  int selectIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const NotificationView(),
    const AcountView(),
    const FavoriteView()
  ];

  @override
   build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar().build(context),
        body: IndexedStack(
          index: selectIndex,
          children: screens,
        ),

        bottomNavigationBar: CustomBottom(
          onIndexChanged: (index){
            setState(() {
              selectIndex = index;
            });
          },
        ),
      ),
    );
  }
}

