import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/bottom_publication.dart';

class PublicationScreen extends StatelessWidget {
  final Publication publicationPost; //!Una forma de obtener el valor de esta variable desde el go_router
  const PublicationScreen({
    super.key, 
    required this.publicationPost,
    });

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              ),
            onPressed: () {
              context.pop();
              },
            ),
        ), 

        body: Column(
          children: [
            Expanded(child: _CustomListView( publicationPost: publicationPost,)),
            BottomPublication(publicationPost: publicationPost,)
          ],
        )

      );
    }
}

class _CustomListView extends StatelessWidget {
  final Publication publicationPost;

  const _CustomListView({required this.publicationPost});

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
    return ListView(
      children: [

        SizedBox(
          child: Image.network(
            publicationPost.imagenes,
            width: 500,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ubicacion: ${publicationPost.ubicacionHabitacion}'),
              Text('Cuarto Disponibles: ${publicationPost.numeroDeCuartosHabitacion}'),
              Text('Fecha de publicacion: ${publicationPost.fechaPublicacion}'),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric( vertical: 4.0),
          child: Icon(Icons.linear_scale),
        ),

        Container(
          padding: const EdgeInsets.symmetric( horizontal: 16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  'Acerca del Cuarto:',
                  style: boldTextStyle,
                ),

                Text(
                  'no tiene esta parte la api xd',
                  style: secondText,
                ),
              ],
            ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric( vertical: 4.0),
          child: Icon(Icons.linear_scale),
        ),


      ],
    );
  }
}



        //           Wrap(
        //             children: <Widget>[
        //               _buildFeatureContainer('wifi', Icons.wifi),
        //               _buildFeatureContainer('Aire Acondicionado', Icons.air),
        //               _buildFeatureContainer('Cocina', Icons.kitchen),
        //               _buildFeatureContainer('Calefacción', Icons.heat_pump),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),

        //     const Icon(Icons.linear_scale),
            
        //     const UserInfoWidget(), // Widget de información del usuario

        //     const CustomBottomAppBar() //* Agregamos dentro del listView para resolver el problema
        //   ],
        // ),

          // Widget _buildFeatureContainer(String text, IconData iconData) {
  //   return Container(
  //     margin: const EdgeInsets.all(8.0),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(text, style: const TextStyle(fontSize: 15)),
  //         const SizedBox(width: 8.0),
  //         Icon(iconData),
  //       ],
  //     ),
  //   );
  // }