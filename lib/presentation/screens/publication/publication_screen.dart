import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/screens/widgets/publication/user_information_publication_container.dart';
import 'package:studenthive/presentation/screens/widgets/publication/bottom_selected_publication.dart';
class PublicationScreen extends StatelessWidget {
  const PublicationScreen({super.key,});

    @override
  Widget build(BuildContext context) {

    const TextStyle boldTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    const TextStyle secondText = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(

        appBar: AppBar(
          title: const Text('Cuarto disponible cerca del TEC'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              context.pop();
              },
            ),
        ),
        
        body: ListView(
          children: <Widget>[
            //ignore: avoid_unnecessary_containers
            Container(
              child: Image.asset(
                'assets/images/1.jpg',
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ubicacion: Mérdia, Yucatán',
                    style: boldTextStyle,
                  ),
                  Text(
                    'Cuartos Disponibles: 1',
                    style: boldTextStyle,
                  ),
                  Text(
                    'Fecha de publicación: 28-Septiembre-2023',
                    style: boldTextStyle,
                  ),
                ],
              ),
            ),

            const Icon(Icons.linear_scale),

            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Acerca del Cuarto:',
                    style: boldTextStyle,
                  ),

                  Text(
                    'Este encantador apartamento de cuatro habitaciones, ubicado en el corazón de la ciudad,'
                    'ofrece comodidad y estilo. Con 80 metros cuadrados, la sala de estar es luminosa y acogedora,'
                    'la cocina de concepto abierto está equipada con electrodomésticos modernos, y los dormitorios'
                    'cuentan con amplias ventanas para una abundante luz natural.',
                    style: secondText,
                  ),
                ],
              ),
            ),

            const Icon(Icons.linear_scale),

            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'El lugar cuenta con:',
                    style: boldTextStyle,
                  ),
                  Wrap(
                    children: <Widget>[
                      _buildFeatureContainer('wifi', Icons.wifi),
                      _buildFeatureContainer('Aire Acondicionado', Icons.air),
                      _buildFeatureContainer('Cocina', Icons.kitchen),
                      _buildFeatureContainer('Calefacción', Icons.heat_pump),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.linear_scale),
            
            const UserInfoWidget(), // Widget de información del usuario

            const CustomBottomAppBar() //* Agregamos dentro del listView para resolver el problema
          ],
        ),

        // bottomNavigationBar: const CustomBottomAppBar(),  /* si agregamos la propiedad el codigo se bugea */

      );
    }

  Widget _buildFeatureContainer(String text, IconData iconData) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: const TextStyle(fontSize: 15)),
          const SizedBox(width: 8.0),
          Icon(iconData),
        ],
      ),
    );
  }
}

