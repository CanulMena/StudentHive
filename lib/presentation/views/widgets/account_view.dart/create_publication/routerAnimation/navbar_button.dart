import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final PageController pageController;

  const BottomButtons({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape:
                  const CircleBorder(side: BorderSide(color: Colors.amber))),
          
          child: const SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape:
                  const CircleBorder(side: BorderSide(color: Colors.amber))),
          
          child: const SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
