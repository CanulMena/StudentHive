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
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (value) {
        setState(() {
          widget.selectIndex(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          backgroundColor: colors.primary,
          label: 'Home'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          backgroundColor: colors.primary,
          label: 'Fovorites'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          backgroundColor: colors.primary,
          label: 'Notificactions'
          ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          backgroundColor: colors.primary,
          label: 'Count'
          ),
      ],
    );
}
}