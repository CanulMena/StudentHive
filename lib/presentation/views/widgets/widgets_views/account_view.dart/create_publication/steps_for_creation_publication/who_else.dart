import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class WhoElse extends StatefulWidget {
  final PageController pageController;
  const WhoElse({super.key, required this.pageController,});

  @override
  State<WhoElse> createState() => _WhoElseState();
}

class _WhoElseState extends State<WhoElse> {
  bool mine = false;
  bool myFamily = false;
  bool friends = false;
  bool rommies = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //? clase que se encuentra en el archivo container_title_appbar.dart
            const TitleAppbar(title: '¿Qué otras personas estarán presentes?'),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
              'Establece quiénes ya están utilizando el espacio para evitar problemas o conflictos.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
    
          _buildOptionRow([
              ContainerOptionWhoElse(
                text: 'Yo',
                icon: Icons.person_outline, 
                isSelected: mine = mine, 
                onTap: () { 
                  setState(() {
                    mine = !mine;
                  });
                  },
              ),
    
              ContainerOptionWhoElse(
                text: 'Familia',
                icon: Icons.groups_outlined,
                isSelected: myFamily = myFamily, 
                onTap: () { 
                  setState(() {
                    myFamily = !myFamily;
                  });
                }, 
              ),
    
            ]),
    
            const SizedBox(
              height: 20,
            ),
    
            _buildOptionRow([
              ContainerOptionWhoElse(
                text: 'Amigos',
                icon: Icons.group_outlined,
                isSelected: friends = friends, 
                onTap: () { 
                  setState(() {
                    friends = !friends;
                  });
                }, 
              ),
              ContainerOptionWhoElse(
                text: 'Compañeros',
                icon: Icons.group_add_outlined,
                isSelected: rommies = rommies, 
                onTap: () { 
                  setState(() {
                  rommies = !rommies;
                  });
                }, 
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          // Mostrar el bottomNavigationBar solo si el teclado no está abierto
          return isKeyboardVisible ? const SizedBox() : ButtomStepscreateP( pageController: widget.pageController, );
        },
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

class ContainerOptionWhoElse extends StatelessWidget {

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ContainerOptionWhoElse({
    super.key,
    required this.text,
    required this.icon, 
    required this.isSelected, 
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.2 * 0.8,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade200.withOpacity(0.4) : Colors.white10,
          border: Border.all(
            color: isSelected ? Colors.black54 : Colors.grey,
            width: isSelected ? 1.4 : 0.75,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size.width * 0.1,
            ),
            Text(
              text,
              style: const TextStyle( fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
