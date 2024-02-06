import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/create_publication_location.dart';

class CretatePublicationSteps1 extends StatefulWidget {
  const CretatePublicationSteps1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CretatePublicationSteps1State createState() =>
      _CretatePublicationSteps1State();
}

class _CretatePublicationSteps1State extends State<CretatePublicationSteps1> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Describe lo mejor que puedas tu lugar',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    OptionsContainerSelector(
                      title: 'Casa propia',
                      desciption:
                          'Los visitantes tienen dominio total de la propiedad',
                      icon: Icons.home,
                      isSelected: selectedOption == 1,
                      onTap: () {
                        setState(() {
                          selectedOption = 1;
                        });
                        saveSelectedOption();
                      },
                    ),
                    const SizedBox(height: 25),
                    OptionsContainerSelector(
                      title: 'Cuarto',
                      desciption:
                          'Cada visitante dispone  de su propia habitación, además de tener acceso a áreas comunes compartidas',
                      icon: Icons.meeting_room,
                      isSelected: selectedOption == 2,
                      onTap: () {
                        setState(() {
                          selectedOption = 2;
                        });
                        saveSelectedOption();
                      },
                    ),
                    const SizedBox(height: 25),
                    OptionsContainerSelector(
                      title: 'Cuarto Compartido',
                      desciption:
                          'Los visitantes comparten un espacio para dormir siguiendo las normas que usted ha establecido',
                      icon: Icons.meeting_room,
                      isSelected: selectedOption == 3,
                      onTap: () {
                        setState(() {
                          selectedOption = 3;
                        });
                        saveSelectedOption();
                      },
                    ),
                    const SizedBox(height: 200),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(15)),
                        CustomNavBarButton(
                          label: 'Atras',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        CustomNavBarButton(
                          label: 'Siguiente',
                          onPressed: () {
                            Navigator.of(context).push(createPageRoute(
                                const CreatePublicationLocation()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void saveSelectedOption() {
  // Aquí puedes realizar la lógica para guardar la opción seleccionada mediante una API.
  // Puedes utilizar el valor de `selectedOption` para enviarlo a la API.
}

class OptionsContainerSelector extends StatelessWidget {
  const OptionsContainerSelector({
    Key? key,
    required this.title,
    required this.desciption,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String desciption;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          //* Contenedor de la Casa propia
          height: size.height * .12,
          width: size.width * 10,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                size: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(desciption),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
