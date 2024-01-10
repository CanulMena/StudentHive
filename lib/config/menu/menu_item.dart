
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

 List<MenuItem> noLoggedMenuItems = [
  MenuItem(
    icon: Icons.settings_outlined, 
    title: 'Settings', 
    linkRoute: '/'
    ),    
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Termns of Service', 
    linkRoute: '/'
    ),    
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Privacy Policy', 
    linkRoute: '/'
    ),    
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Open-source licences', 
    linkRoute: '/'
    ),
  ];

List<MenuItem> loggedSettigMenuItems = [
  MenuItem(
    icon: Icons.person_outline_outlined, 
    title: 'Personal information', 
    linkRoute: '/'
    ),
  MenuItem(
    icon: Icons.security, 
    title: 'Login and Security', 
    linkRoute: '/login'
    ),
  MenuItem(
    icon: Icons.notifications_none_outlined, 
    title: 'Notifications', 
    linkRoute: '/reserve'
    ),
  ];

List<MenuItem> legalMenuItems = [
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Termns of Service', 
    linkRoute: '/'
    ),    
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Privacy Policy', 
    linkRoute: '/'
    ),    
  MenuItem(
    icon: Icons.menu_book_outlined, 
    title: 'Open-source licences', 
    linkRoute: '/'
    ),
  ];