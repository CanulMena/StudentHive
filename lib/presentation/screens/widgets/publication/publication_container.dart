import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/image_container.dart';
import 'package:studenthive/presentation/screens/widgets/publication/information_container.dart';

class PublicationContainer extends StatelessWidget {
  final Publication imagePost; 
  final Widget navegateToPublication;

  const PublicationContainer({
    super.key, 
    required this.imagePost,  
    required this.navegateToPublication,
    });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => navegateToPublication ,));
      },
      
      child: Container(
        //! Publication container
        height: size.height * 0.56, 
        width: size.width * 0.86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),  // Color de la sombra
              spreadRadius: 6,  // Distancia de la propagación de la sombra
              blurRadius: 8,  // Radio del desenfoque de la sombra
              offset: const Offset(0, 3),  // Desplazamiento de la sombra
              ),
            ],
        ),
        child: Column(
          children: [
            ImageContainer( imagePost: imagePost,),
            InformationContainer(imagePost: imagePost,)
          ],
        ),
      ),
    );
  }
}

