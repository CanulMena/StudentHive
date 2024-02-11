import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {

  const NotificationView({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.white, elevation: 0, actions: const [
        Text(
          '',
          style: TextStyle(color: Colors.black87),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: const [
            Text(
              'Notificaciones',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
