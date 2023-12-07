import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/publication/manage_request.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              children: [
                Text(
                  '\$1800 MXN',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageRequest()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
              ),
              child: const Text(
                'Reservar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
