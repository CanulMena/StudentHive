import 'package:flutter/material.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'No te han echo y has echo alguna solicitud aún',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Reserva tu lugar favorito y disfruta de tu estancia en tu espacio perfecto.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
