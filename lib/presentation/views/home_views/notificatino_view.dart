import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/notifications/accepted_notification_container.dart';

//! test user entity
class User {
  final int userId;
  final int contactNumber;
  final String firstName;
  final String lastName;
  final String urlPhoto;

  User({
    required this.contactNumber,
    required this.firstName,
    required this.lastName,
    required this.urlPhoto,
    required this.userId,
  });
}

//? Enumeración para los tipos de notificaciones
enum NotificationType { reserve, accepted, notAccepted }

//! test notification entity
class Notification {
  final User user;
  final String title;
  final int notificationTime;
  final NotificationType type;

  Notification({
    required this.user,
    required this.title,
    required this.notificationTime,
    required this.type,
  });
}


class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        SizedBox(),
        NotificationContainer1(
          messageConst: messageConst,
          messageApi: messageApi,
        ),
        NotificationContainer2(
          messageConst: messageConst,
          messageApi: messageApi,
        ),
        NotificationContainer3(
          messageConst: messageConst, 
          messageApi: messageApi
        ),
        // ? Agrega más instancias según sea necesario
      ],
    );
  }
}