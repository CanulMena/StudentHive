import 'package:flutter/material.dart';

class CustomButtomNavegationBar extends StatefulWidget {
  final ValueChanged selectIndex;  
  final int selectedIndex;
  const CustomButtomNavegationBar({super.key, required this.selectIndex, required this.selectedIndex,});

  @override
  State<CustomButtomNavegationBar> createState() => _CustomButtomNavegationBarState();
}

class _CustomButtomNavegationBarState extends State<CustomButtomNavegationBar> {

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    // final homeProvider = context.watch<HomeProvider>();

    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,//*El index que seleccinaré del BottomNavegationBarItem
      onTap: (value) {
        setState(() {
          widget.selectIndex(value);
          // homeProvider.setIndex(value);
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