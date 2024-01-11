import 'package:flutter/material.dart';

//* NOTIFICACIÓN DE SOLICITUDES ACEPATADAS
class NotificationContainer1 extends StatelessWidget {
  final String messageConst;
  final String messageApi;

  const NotificationContainer1({super.key, required this.messageConst, required this.messageApi});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:size.height * .10,
        width: size.width * .34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            top: BorderSide(color: Colors.grey, width: .5),
            bottom: BorderSide(color: Colors.grey, width: .5),
            left: BorderSide(color: Colors.grey, width: .5),
            right: BorderSide(color: Colors.grey, width: .5)
          ),
          color: Colors.white
        ),
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(5.0) 
            ),
            
            //? Es el contendor de la imagen
            Container(
              height: size.height * .15,
              width: size.width * 0.29 * 0.60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: size.height * .10,
              width: size.width * .67,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tu solicitud a sido aprobada por favor contacta con este numero para terminar el proceso',
                    style: TextStyle(
                    ),
                  ),
                  Text(
                    //! Se cambia por el numero de telefono del usuario
                    'Numero de contacto usuario',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}