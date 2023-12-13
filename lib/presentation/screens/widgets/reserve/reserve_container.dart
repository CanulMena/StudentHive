import 'package:flutter/material.dart';

class ReserveContainer extends StatelessWidget {
  const ReserveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
    //!Reserve container
    alignment: Alignment.center,
    height: size.height * .20,
    width: size.width * .95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:    const Color.fromARGB(255, 0, 79, 122),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),  // Color de la sombra
          spreadRadius: 6,  // Distancia de la propagación de la sombra
          blurRadius: 8,  // Radio del desenfoque de la sombra
          offset: const Offset(0, 3),  // Desplazamiento de la sombra
          ),
        ],
    ),
        child: Row( 
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //!Image container
              padding: const EdgeInsets.all(5),
              height: size.height * .20 * 100,
              width: size.width * .95 * .40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.blue
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/1.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
            //!Information container
              padding: const EdgeInsets.all(5),
              height: size.height * .20 * 100,
              width: size.width * .95 * .45,
              decoration: const BoxDecoration(
                // color: Colors.green
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'Cerca de la UTM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '\$${1800}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Emmanuel Yama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              )
            ),

            IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: const Icon(
                Icons.clear
              )),
            // Container(
            //   //!Icon container
            //    decoration: const BoxDecoration(
            //     color: Colors.orange
            //   ),
            //   height: size.height * .20 * 100,
            //   width: size.width * .95 * .15,
            //   child: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.delete
            //   )),
            // )
          ],
        ),
      );

  }
}
