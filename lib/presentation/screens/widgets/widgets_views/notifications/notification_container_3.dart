import 'package:flutter/material.dart';

//! NOTIFICACIONES DE SOLICITUDES VISTA DEL ANFITRION
class NotificationContainer3 extends StatelessWidget {
  final String messageConst;
  final String messageApi;

  const NotificationContainer3({super.key, required this.messageConst, required this.messageApi});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:size.height * .20,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(5.0)
            ),
            //? Es el contendor de la imagen
            Container(
              height:   size.height * .15,
              width: size.width * 0.29 * 0.60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: size.height * .10,
                    width: size.width * .67,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          //! Se cambia por el numeor de telefono del usuario
                          'Gustavo Mena',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.red
                          ),
                        ),
                        Text(
                          'a mandado una solicitud revisalo ahora. ',
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          //! Logica del boton Aceptar
                        },
                        style: const ButtonStyle(
                          
                        ),
                        child: const Text(
                          'Aceptar',
                        ),
                      ),
                      const SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: () {
                          //! Logica del boton Aceptar
                        },
                        child: const Text(
                          'Rechazar',
                          style: TextStyle(
                          ),
                        )
                      )
                    ],
                  )
                ],
              )
            ),
          ]
        ),
      ),
    );
  }
}
