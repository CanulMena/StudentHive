import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/house.dart';

class BottomPublication extends StatelessWidget {
  final House houseDetail;
  const BottomPublication({super.key, required this.houseDetail});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.10,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 229, 218, 218)
          ),
        )
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
    
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${houseDetail.rentPrice} MXN',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'AL MES',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
    
            ElevatedButton(
              onPressed: () {
                // if(authProvider.isLogged){ //TODO: Terminar la validacino
                // context.push('/reserve',);
                // reserveProvider.addReservation(publicationPost);
                // } else {
                //   DialogUtils.openDialog(context, authProvider, userProvider);
                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                'Reservar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
    
          ],
        ),
    );
  }
}
