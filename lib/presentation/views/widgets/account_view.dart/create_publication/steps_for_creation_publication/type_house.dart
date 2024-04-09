import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart'; // refactor this

class TypeHouse extends StatefulWidget {
  const TypeHouse({super.key});

  @override
  TypeHouseState createState() => TypeHouseState();
}

class TypeHouseState extends State<TypeHouse> {
  String typeHouseRental = '';

  int selectedOption = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(children: [
            const TitleAppbar(title: 'Decribe lo mejor que puedas tu espacio'),
            const SizedBox(height: 40),
            OptionsContainerSelector(
              title: 'Casa propia',
              desciption: 'Los visitantes tienen dominio total de la propiedad',
              icon: Icons.home,
              isSelected: selectedOption == 1,
              onTap: () {
                setState(() {
                  selectedOption = 1;
                  typeHouseRental = 'OwnHouse';
                  context.go(
                      '/create-publication/type-house/create-publication-steps/$typeHouseRental');
                });
              },
            ),
            const SizedBox(height: 25),
            OptionsContainerSelector(
              title: 'Cuarto',
              desciption:
                  'Cada visitante dispone  de su propia habitación, además de tener acceso a áreas comunes compartidas',
              icon: Icons.meeting_room_rounded,
              isSelected: selectedOption == 2,
              onTap: () {
                setState(() {
                  selectedOption = 2;
                  typeHouseRental = 'Room';
                  context.go(
                      '/create-publication/type-house/create-publication-steps/$typeHouseRental');
                });
              },
            ),
            const SizedBox(height: 25),
            OptionsContainerSelector(
              title: 'Cuarto Compartido',
              desciption:
                  'Los visitantes comparten un espacio para dormir siguiendo las normas que usted ha establecido',
              icon: Icons.meeting_room_rounded,
              isSelected: selectedOption == 3,
              onTap: () {
                setState(() {
                  selectedOption = 3;
                  typeHouseRental = 'SharedRoom';
                  context.go(
                      '/create-publication/type-house/create-publication-steps/$typeHouseRental');
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}

class OptionsContainerSelector extends StatelessWidget {
  const OptionsContainerSelector({
    super.key,
    required this.title,
    required this.desciption,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String desciption;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: size.height * 0.15,
        width: size.width * 0.95,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.grey.shade200.withOpacity(0.4)
              : Colors.white10,
          border: Border.all(
            color: isSelected ? Colors.black54 : Colors.grey,
            width: isSelected ? 1.4 : 0.75,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      desciption,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  icon,
                  size: 40,
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
