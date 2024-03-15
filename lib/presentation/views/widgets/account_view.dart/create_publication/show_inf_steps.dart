import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class CreatePublicationInit extends StatelessWidget {
  const CreatePublicationInit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                TitleAppbar(title: 'Comparte tu espacio de manera sencilla'),
                SizedBox(height: 40),
                _ShowInfoSteps(
                  stepNumber: '1',
                  title: 'Describe tu cuarto',
                  subtitle:
                      'Agrega algunos datos sencillos por ejemplo donde te encuntras, número de habitaciones, baños, etc.',
                  icon: Icons.location_on_outlined,
                ),
                _ShowInfoSteps(
                  stepNumber: '2',
                  title: 'Personaliza tu espacio',
                  subtitle:
                      'Agregar al menos tres fotos, un titulo y una descripción. Nosotros te ayudamos',
                  icon: Icons.house_outlined,
                ),
                _ShowInfoSteps(
                  stepNumber: '3',
                  title: 'Publica tu espacio',
                  subtitle:
                      'Finaliza compartiendo tu espacio y busca un roomie.',
                  icon: Icons.check,
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: 90, // Altura del área inferior
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push('/create-publication/type-house');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow.shade800),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 9),
                      child: Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class _ShowInfoSteps extends StatelessWidget {
  final String stepNumber;
  final String title;
  final String subtitle;
  final IconData icon;

  const _ShowInfoSteps({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: size.width * 1,
        height: size.height * 0.18,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.75)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                stepNumber,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              //*Gracias al expanded pueda hacer que esto sea flexible.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null,
                  ),
                  Text(
                    subtitle,
                    style:
                        textStyle.bodyMedium?.copyWith(color: Colors.black54),
                  )
                ],
              ),
            ),
            Icon(icon)
          ],
        ));
  }
}