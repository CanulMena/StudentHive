import 'package:flutter/material.dart';

class ButtomStepscreateP extends StatelessWidget {
  final PageController pageController;
  final bool isButtonEnabled;
  const ButtomStepscreateP({
    super.key,
    this.isButtonEnabled = false,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09, // Ajusta la altura directamente aquí
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 229, 218, 218),
            width: 1.0, // Ancho del borde
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 2),
          InkWell(
            onTap: () {
              isButtonEnabled 
              ? pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              )
              : null;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: isButtonEnabled ? Colors.amber : Colors.grey,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
