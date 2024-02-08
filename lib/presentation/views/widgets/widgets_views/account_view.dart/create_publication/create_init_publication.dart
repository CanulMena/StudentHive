import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/app_steps_create_publications.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class CreatePublicationInit extends StatelessWidget {
  const CreatePublicationInit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            //? TitleAppbar es una clase que se encarga de mostrar el titulo de la appbar
            //? clase que se encuentra en el archivo container_title_appbar.dart
            const TitleAppbar(
                title: 'Comparte tu espacio de manera sencilla'),
            const SizedBox(height: 80),
            const ContainerInit(
              title: '1. Describe tu cuarto',
              subtitle:
                  'Agrega algunos datos sencillos por ejemplo donde te encuntras, número de habitaciones, baños, etc.',
              icon: Icons.edit_location_alt_sharp,
            ),
            const SizedBox(height: 40),
            const ContainerInit(
              title: '2. Personaliza tu espacio',
              subtitle:
                  'Agregar al menos tres fotos, un titulo y una descripción. Nosotros te ayudamos',
              icon: Icons.add_home_rounded,
            ),
            const SizedBox(height: 40),
            const ContainerInit(
              title: '3. Publica tu espacio',
              subtitle: 'Finaliza compartiendo tu espacio y busca un roomie.',
              icon: Icons.check_circle,
            ),
            const SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    createPageRoute(const AppStepsCreatePublications()));
              },
              child: const Text('Comenzar')
            )
          ]),
        )
      ),
    );
  }
}

class ContainerInit extends StatelessWidget {
  const ContainerInit(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.9,
        height: size.height * 0.12,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.7,
                  child: Text(
                    subtitle,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Icon(icon, size: 50)
          ],
        ));
  }
}
