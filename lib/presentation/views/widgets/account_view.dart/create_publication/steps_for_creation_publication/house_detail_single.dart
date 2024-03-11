import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/conatiner_details_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class DetailsSingleHouse extends StatefulWidget {
  final Function(int, int, int, int) onNext;
  final PageController pageController;

  const DetailsSingleHouse({super.key, required this.pageController, required this.onNext, });

  @override
  State<DetailsSingleHouse> createState() => _DetailsSingleHouseState();
}

class _DetailsSingleHouseState extends State<DetailsSingleHouse> {

  int numberOfVisitors = 0;
  int numberOfBeds = 0;
  int numberOfHammocks = 0;
  int numberOfBathrooms = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleAppbar(
                title: 'Incorpora información esencial a tu espacio'),
            const SizedBox(height: 30),
            ContainerDetailHouse(
              text: 'Visitantes',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: numberOfVisitors,
              onIncrement: () {
                  setState(() {
                    numberOfVisitors++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    numberOfVisitors = max(0, numberOfVisitors - 1);
                  });
                },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Camas',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: numberOfBeds,
              onIncrement: () {
                  setState(() {
                    numberOfBeds++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    numberOfBeds = max(0, numberOfBeds - 1);
                  });
                },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Hamaqueros',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: numberOfHammocks,
              onIncrement: () {
                  setState(() {
                    numberOfHammocks++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    numberOfHammocks = max(0, numberOfHammocks - 1);
                  });
                },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Baños',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: numberOfBathrooms,
              onIncrement: () {
                  setState(() {
                    numberOfBathrooms++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    numberOfBathrooms = max(0, numberOfBathrooms - 1);
                  });
                },
            ),
          ],
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          // Mostrar el bottomNavigationBar solo si el teclado no está abierto
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP( 
            pageController: widget.pageController, 
            isButtonEnabled: true,
            onNext: () {
              widget.onNext(
                numberOfVisitors, 
                numberOfBeds, 
                numberOfHammocks, 
                numberOfBathrooms);
            },
            );
        },
      ),
    );
  }
}
