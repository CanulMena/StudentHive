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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const[
          //?Esto deajalo así luego vemos que ponemos XD
          Text(
            'asdf',
            style: TextStyle(
              color: Colors.black87
            ),
            ),
        ]
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [

            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox( height: 40,),

            ...notificationList.map(
              (notification) => AcceptedNotificationContainer(
                titleNotification: notification.title,
                user: notification.user,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//? usuaremos un gestor de estado para hacer un get de publicaciones. 
List<Notification> notificationList = [
  Notification(
    user: userList[0  /* 'esto estará de acuerdo a su idUser, para saber que usuario es' */  ],
    title: 'Accepted Notification',
    notificationTime: 1,
    type: NotificationType.accepted,
  ),
  Notification(
    user: userList[1],
    title: 'Accepted Notification',
    notificationTime: 1,
    type: NotificationType.accepted,
  ),
];

//? usuaremos un gestor de estado para hacer un get de usuarios
List<User> userList = [
  User(
    userId: 1,
    contactNumber: 9999204857, 
    firstName: 'Gustavo', 
    lastName: 'Canul', 
    urlPhoto: 'https://scontent.fmid2-1.fna.fbcdn.net/v/t39.30808-6/262531647_1775392782659993_5430604383254748736_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeGI6LsoBo0sP1mlu5ispk6illY1StML69SWVjVK0wvr1FYu4BNbn47F0IKTzxas49JTQyYd_0chbB0bd3M6VB_w&_nc_ohc=TpCOEX9YRJ0AX-Mg31M&_nc_ht=scontent.fmid2-1.fna&oh=00_AfBvQuI30-4kqdmdsPSP0P4VUBDyFTjV4ryZty6WAhIvGw&oe=65A4D625'
    ),
  User(
    userId: 2,
    contactNumber: 9999204857, 
    firstName: 'Yahir', 
    lastName: 'Poot', 
    urlPhoto: 'https://scontent.fmid2-1.fna.fbcdn.net/v/t39.30808-6/382607457_1760528491059971_5996363665348317957_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeGinCodnfNmMFGFsnJYs4ovm5TuoFaP-p2blO6gVo_6nT52ZR54nxEJ_U2ZAHhc2X-0PnyE4CwtdKYezLq5K6Pd&_nc_ohc=1BGVed220vkAX_Mczpm&_nc_ht=scontent.fmid2-1.fna&oh=00_AfAdccy0f-lnUQCshGGXmPq5kuqfHiUbHsfP9SZBgmeN8A&oe=65A63BD5'
    )
];