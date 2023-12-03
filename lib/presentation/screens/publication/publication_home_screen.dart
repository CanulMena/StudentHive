import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/screens/widgets/custom_appbar.dart';

class PublicationHomeScreen extends StatelessWidget {
  const PublicationHomeScreen({super.key});

  @override
   build(BuildContext context) {

    final homeProvider = context.watch<HomeProvider>();
    
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar().build(context),

        body: IndexedStack(
          index: homeProvider.selectedIndex,
          children: homeProvider.screens,
        ),

        bottomNavigationBar: const CustomBottom(),
      ),
    );
  }
}

