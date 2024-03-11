import 'package:flutter/material.dart';

//* NOTIFICACIÓN DE SOLICITUDES ACEPATADAS
class ReservationAcceptedNotificationContainer extends StatelessWidget {
  final String user;
  final String titleNotification;

  const ReservationAcceptedNotificationContainer({
    super.key,
    required this.user,
    required this.titleNotification,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: size.height * .16,
      width: size.width * .34,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: .5),
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
            child: const CircleAvatar(
              backgroundImage: NetworkImage(''),
            ),
          ),

          Container(
            //?InformationContainer
            padding: const EdgeInsets.all(10),
            height: size.height * .16,
            width: size.width * .67,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Felicidades su solicitud a sido aprobada por favor termina el proceso de reserva ',
                  style:
                      TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                ),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 77, 202, 218)),
                    ),
                    child: const Text('Terminar Reserva')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
