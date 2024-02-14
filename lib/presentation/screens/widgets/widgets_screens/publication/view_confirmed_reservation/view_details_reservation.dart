import 'package:flutter/material.dart';

class ContainerDetailsReservation extends StatelessWidget {
  const ContainerDetailsReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 1,
      height: size.height * 0.30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Detalles de la reservación',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
