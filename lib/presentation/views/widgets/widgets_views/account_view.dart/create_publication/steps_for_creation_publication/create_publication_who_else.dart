import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/create_publication_images.dart';

class DataPerson extends StatelessWidget {
  const DataPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '¿Qué otras personas estarán presentes?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _messageInPage(),
            _buildOptionRow([
              const ContainerOptionWhoElse(
                text: 'Yo',
                icon: Icons.person_outline,
              ),
              const ContainerOptionWhoElse(
                text: 'Familia',
                icon: Icons.groups_outlined,
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            _buildOptionRow([
              const ContainerOptionWhoElse(
                text: 'Amigos',
                icon: Icons.group_outlined,
              ),
              const ContainerOptionWhoElse(
                text: 'Compañeros',
                icon: Icons.group_add_outlined,
              ),
            ]),
            const SizedBox(height: 280),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                CustomNavBarButton(
                    label: 'Atras',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(width: 90),
                CustomNavBarButton(
                  label: 'Siguiente',
                  onPressed: () {
                    Navigator.of(context)
                        .push(createPageRoute(const AddImages()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _messageInPage() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Establece quiénes ya están utilizando el espacio para evitar problemas o conflictos.',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _buildOptionRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}

class ContainerOptionWhoElse extends StatefulWidget {
  const ContainerOptionWhoElse({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  State<ContainerOptionWhoElse> createState() => _ContainerOptionWhoElseState();
}

class _ContainerOptionWhoElseState extends State<ContainerOptionWhoElse> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.4;
    final iconSize = screenSize.width * 0.2;

    return SizedBox(
      width: buttonWidth,
      height: 150,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.grey[200]),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          side: MaterialStateProperty.all(
              BorderSide(color: isSelected ? Colors.cyan : Colors.grey)),
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: iconSize,
            ),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
