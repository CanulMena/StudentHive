import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Radius radius = Radius.circular(20);
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),  
              child: Container(
                //! Publication container
                height: size.height * 0.56, 
                width: size.width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    Container(
                      //! Contenedor de imagen
                      height: size.height * 0.56 * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: radius,
                          topRight: radius
                        ),
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      //! Contenedor de información
                      height: size.height * 0.56 * 0.3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: radius,
                          bottomRight: radius
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
