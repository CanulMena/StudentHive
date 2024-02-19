import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HousePrice extends StatelessWidget {
  final PageController pageController;
  const HousePrice({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 0, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? clase que se encuentra en el archivo container_title_appbar.dart
              const TitleAppbar(title: 'Establece un precio para tu espacio'),
              _message(),
              Container(
                width: screenSize.width * 1,
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          // Mostrar el bottomNavigationBar solo si el teclado no está abierto
          return isKeyboardVisible ? const SizedBox() : ButtomStepscreateP(  pageController: pageController, );
        },
      ),
    );
  }

  Widget _message() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: const Text(
        'Se peude cambiar caundo tu quieras.',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
