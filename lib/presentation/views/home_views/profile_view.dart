import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/profile_view/create_profile_view.dart';

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
                  height: size.height * 0.3,
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
                        height: size.height * 0.5 * 0.3,
                        width: size.width * 0.5 * 0.7,
                        child: ClipOval(
                          child: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.3 * 0.05,
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
                ),
                SizedBox(
                  height: size.height * 0.3 * 0.05,
                ),
                const ContainerInformation(
                  textInfromation:
                      'Crea un perfil para que los demas usuarios puedan conocerte mejor y puedan contactarte mas facilmente.',
                ),
                SizedBox(
                  height: size.height * 0.5 * 0.3,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(createPageRoute(const CreateProfileView()));
                  },
                  child: const Text(
                    'Crear Perfil',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class ContainerInformation extends StatelessWidget {
  const ContainerInformation({super.key, required this.textInfromation});

  final String textInfromation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          textInfromation,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
