import 'package:flutter/material.dart';

//? Enumeración para los tipos de notificaciones
enum NotificationType { reserve, accepted, notAccepted }

//! test notification entity
class Notification {
  // final User user;
  final String title;
  final int notificationTime;
  final NotificationType type;

  Notification({
    // required this.user,
    required this.title,
    required this.notificationTime,
    required this.type,
  });
}

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

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
            // ...notificationList.map(
            //   (notification) => const HostViewNotificationContainer(
            //     titleNotification: '',
            //     user: '',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

//? we are using un g de state para do un get de publications.
// List<Notification> notificationList = [
//   Notification(
//     user: userList[0],
//     title: 'Accepted Notification',
//     notificationTime: 1,
//     type: NotificationType.accepted,
//   ),
// ];
