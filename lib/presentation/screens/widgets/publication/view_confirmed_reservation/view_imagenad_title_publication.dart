import 'package:flutter/material.dart';

class ContainerImageAndTitle extends StatelessWidget {
  const ContainerImageAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.17,
      width: size.width * 1,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //? Contenedor de la imagen
          Container(
            height: size.height * 0.5 * 0.25,
            width: size.width * 0.40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              // image: const DecorationImage(
              //   image: AssetImage('assets/images/house.jpg'),
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.5 * 0.25,
            child: const Text('tu mejor opcion'),
          ),
        ]
      )
    );
  }
    
}