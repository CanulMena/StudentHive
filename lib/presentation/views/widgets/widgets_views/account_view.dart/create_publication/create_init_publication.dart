import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/create_publication_steps1.dart';

class CreatePublicationInit extends StatelessWidget {
  const CreatePublicationInit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
            leading: ButtonBar(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            title: const Text('Comparte tu cuarto de manera sencilla')),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 20),
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 600,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('1. Describe tu cuarto',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 30),
                          Icon(Icons.add_location_alt_outlined, size: 50)
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Agrega algunos datos sencillos por ejemplo donde te encuentras, numeoro de visitantes.',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 50),
                      const Row(
                        children: [
                          Text('2. Personaliza tu cuarto',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 30),
                          Icon(Icons.add_home_outlined, size: 50)
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Agregar al menos tres fotos, un titulo y una descripcion, Nosotros te ayudamos',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 50),
                      const Row(
                        children: [
                          Text(
                            '3. Publica tu cuarto',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 50),
                          Icon(
                            Icons.check,
                            size: 40,
                          )
                        ],
                      ),
                      Text(
                        'Finaliza compartiendo tu cuarto y busca un rommíe',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        createPageRoute(const CretatePublicationSteps1()));
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF159A9C)),
                  ),
                  child: const Text('Empezar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            )),
      ),
    );
  }
}
