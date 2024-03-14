import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            //! Aquí se cambia por el
            ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  // color: Colors.white,
                  width: size.width * 0.9,
                  height: size.height * 0.5 * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2,
                      )),
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(20)),
                      SizedBox(
                        height: size.height * 0.5 * 0.2,
                        width: size.width * 0.5 * 0.5,
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.cover),
                      ),
                      const Text(
                        'Nombre de usuario',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Correo electronico',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
