import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/home_views/notification_view.dart';

//* NOTIFICACIÓN DE SOLICITUDES ACEPATADAS
class ReservationAcceptedNotificationContainer extends StatelessWidget {
  final String titleNotification;
  final User user;

  const ReservationAcceptedNotificationContainer({
    super.key,
    required this.titleNotification,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: size.height * .10,
      width: size.width * .34,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
              top: BorderSide(color: Colors.grey, width: .5),
              bottom: BorderSide(color: Colors.grey, width: .5),
              left: BorderSide(color: Colors.grey, width: .5),
              right: BorderSide(color: Colors.grey, width: .5)),
          color: Colors.white),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(5.0)),

          //? Es el contendor de la imagen
          Container(
            height: size.height * .15,
            width: size.width * 0.29 * 0.60,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.urlPhoto),
            ),
          ),

          Container(
            //?InformationContainer
            padding: const EdgeInsets.all(10),
            height: size.height * .10,
            width: size.width * .67,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  //! Se cambia por el numero de telefono del usuario
                  titleNotification,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.red),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
