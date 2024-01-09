
import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String linkRoute;

  MenuItem({
    required this.icon, 
    required this.title, 
    required this.linkRoute
    });
}

 List<MenuItem> appMenuItems = [
    MenuItem(
      icon: Icons.settings_rounded, 
      title: 'Edit account and profile', 
      linkRoute: '/editAccount'
      ),
    MenuItem(
      icon: Icons.security, 
      title: 'login and security', 
      linkRoute: '/login'
      ),    
  ];