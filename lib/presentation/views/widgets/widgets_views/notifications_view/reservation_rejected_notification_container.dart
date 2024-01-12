import 'package:flutter/material.dart';

//* NOTIFICACIONES DE SOLICITUDES RECHAZADAS
class ReservationRejectedNotificationContainer extends StatelessWidget {
  final String messageConst;
  final String messageApi;

  const ReservationRejectedNotificationContainer({super.key, required this.messageConst, required this.messageApi});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: size.height * .30,
        width: size.width * .34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white, 
            border: const Border(
              top: BorderSide(color: Colors.grey, width: .5),
              bottom: BorderSide(color: Colors.grey, width: .5),
              left: BorderSide(color: Colors.grey, width: .5),
              right: BorderSide(color: Colors.grey, width: .5)
            ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              height: size.height * .30,
              width: size.width * .85,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'El apartartamento ya no se encuentra disponible pero aquí te dejamos algunas publicaciones que te pueden gustar ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Link de Publicacion 1',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );  
  }
}