import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final PageController pageController;

  const BottomButtons({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.amber,
                size: 40,
              )),
          IconButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.amber,
                size: 40,
              ))
          // ElevatedButton(
          //   onPressed: () {
          //     pageController.nextPage(
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.ease);
          //   },
          //   // ignore: sort_child_properties_last
          //   child: const SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: Icon(
          //       Icons.arrow_forward,
          //       color: Colors.white,
          //     ),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.amber,
          //       elevation: 0,
          //       shadowColor: Colors.transparent,
          //       shape:
          //           const CircleBorder(side: BorderSide(color: Colors.amber))),
          // )
        ],
      ),
    );
  }
}
