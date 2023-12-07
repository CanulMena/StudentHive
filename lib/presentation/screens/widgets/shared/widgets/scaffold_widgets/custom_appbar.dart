import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.search)
          ),
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
          ),
        ],
      );
  }
}