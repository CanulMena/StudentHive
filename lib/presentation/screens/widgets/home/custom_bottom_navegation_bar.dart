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

    return BottomNavigationBar( 
      fixedColor: Colors.amber, //This is to add colors when i select an options
      elevation: 0,
      currentIndex: widget.selectedIndex, //*Se pasa en index actual que le pasamos en el homescreen
      onTap: (value) {
        setState(() {
          widget.selectIndex(value); //* --> manda el numero por medio del ValueChanged
        });
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.maps_home_work, color: Colors.amber.shade800,size: 28),
          icon: Icon(Icons.maps_home_work_outlined, color: Colors.grey.shade500, size: 28,),
          label: 'Home'
          ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.favorite, color: Colors.amber.shade800,size: 28),
          icon: Icon(Icons.favorite_border_outlined, color: Colors.grey.shade500,size: 28),
          label: 'Fovorites'
          ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.notifications, color: Colors.amber.shade800,size: 28),
          icon: Icon(Icons.notifications_outlined, color: Colors.grey.shade500,size: 28),
          label: 'Notificactions'
          ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person, color: Colors.amber.shade800,size: 28),
          icon: Icon(Icons.person_outline_outlined, color: Colors.grey.shade500,size: 28),
          label: 'Count'
          ),
      ],
    );
}
}