import 'package:flutter/material.dart';

// //! test user entity
// class User {
//   final int userId;
//   final int? contactNumber;
//   final String firstName;
//   final String lastName;
//   final String? urlPhoto;

//   User({
//     this.contactNumber,
//     required this.firstName,
//     required this.lastName,
//     this.urlPhoto,
//     required this.userId,
//   });
// }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: const [

            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox( height: 40,),


          ],
        ),
      ),
    );
  }
}


