import 'package:flutter/material.dart';

class ContainerPayReservation extends StatelessWidget {
  const ContainerPayReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.17,
        width: size.width * 1,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(height: 40,),
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.5 * 25,
                child: const Column(
                  children: [
                    Text(
                      'Pagar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('tarjetas')
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Pagar'),
              )
            ]));
  }
}
