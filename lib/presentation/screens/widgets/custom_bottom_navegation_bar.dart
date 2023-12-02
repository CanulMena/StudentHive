import 'package:flutter/material.dart';

class CustomBottom extends StatefulWidget {

  final void Function(int) onIndexChanged;
  
  const CustomBottom({
    super.key, 
    required this.onIndexChanged
    });

  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      currentIndex: selectIndex,//agregamos selectIndex para seleccionar un BottomNavegationBar
      onTap: (value) {
        setState(() {
          selectIndex = value;/*cuando seleccionamos un BottomNavegationBar... agregará su numero de index a value 
          y selectIndex tomará el valor de value*/
          
          widget.onIndexChanged(value);
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