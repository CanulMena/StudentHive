import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';

class FavoriteView extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  const FavoriteView({super.key, required this.favoriteProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [

          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Text(
                'Edit', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black, // Cambia el color del subrayado
                  decorationThickness: 2.0, // Ajusta el grosor del subrayado
                  decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            )

          ],  
        ),

      body: const SizedBox(),

      );
  }
}
