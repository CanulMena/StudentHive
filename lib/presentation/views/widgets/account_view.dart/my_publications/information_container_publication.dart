import 'package:flutter/material.dart';

class MyPublicationInformationContainer extends StatelessWidget {
  const MyPublicationInformationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final textStyle = Theme.of(context).textTheme;
    const textSyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return SizedBox(
      //! Contenedor de la informacion de la publicacion
      height: size.height * 0.50 * 0.25,
      child: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'titulo de la publicacion',
                  style: textSyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text('fecha de publicacion', style: textSyle),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text('status de la publicacion', style: textSyle))
            ],
          ),
        ),
      ),
    );
  }
}
