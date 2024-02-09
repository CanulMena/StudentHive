import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/app_steps_create_publications.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/app_steps_singleR_createP.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class TypeHouse extends StatefulWidget {
  const TypeHouse({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TypeHouseState createState() => _TypeHouseState();
}

class _TypeHouseState extends State<TypeHouse> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          //? clase que se encuntra en el archivo container_title_appbar.dart
          const TitleAppbar(title: 'Decribe lo mejor que puedas tu espacio'),
          const SizedBox(height: 50),
          OptionsContainerSelector(
            title: 'Casa propia',
            desciption: 'Los visitantes tienen dominio total de la propiedad',
            icon: Icons.home,
            isSelected: selectedOption == 1,
            onTap: () {
              setState(() {
                selectedOption = 1;
              });
              saveSelectedOption();
            },
            route: createPageRoute(const AppStepsCreatePublications()),
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
            route: createPageRoute(const AppStepsCreateSinglePublications()),
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
            route: createPageRoute(const AppStepsCreateSinglePublications()),
          )
        ]),
      ),
    );
  }
}

void saveSelectedOption() {
  // Aquí puedes realizar la lógica para guardar la opción seleccionada mediante una API.
  // Puedes utilizar el valor de `selectedOption` para enviarlo a la API.
}

class OptionsContainerSelector extends StatelessWidget {
  const OptionsContainerSelector(
      {Key? key,
      required this.title,
      required this.desciption,
      required this.icon,
      required this.isSelected,
      required this.onTap,
      required this.route})
      : super(key: key);

  final String title;
  final String desciption;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final PageRoute route;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
        if (isSelected) {
          Navigator.of(context).push(route);
        }
      },
      child: Container(
        height: size.height * 0.15,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.amber : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.6,
                height: size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
