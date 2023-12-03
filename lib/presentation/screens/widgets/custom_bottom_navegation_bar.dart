import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';

class CustomBottom extends StatefulWidget {
  
  const CustomBottom({
    super.key, 
    });

  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final homeProvider = context.watch<HomeProvider>();

    return BottomNavigationBar(
      currentIndex: homeProvider.selectedIndex,
      onTap: (value) {
        setState(() {
          homeProvider.setIndex(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          backgroundColor: color.primary,
          label: 'Home'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          backgroundColor: color.primary,
          label: 'Notificactions'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          backgroundColor: color.primary,
          label: 'Count'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          backgroundColor: color.primary,
          label: 'Fovorites'
          ),
      ],
    );
}
}