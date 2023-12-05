import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

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
    const Radius radius = Radius.circular(20);
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
        ),
        child: Column(
          children: [
            Container(
              //! Contenedor de imagen
              height: size.height * 0.56 * 0.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: radius,
                  topRight: radius
                ),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: radius,
                  topRight: radius
                ),
                child: Image.asset(
                  imagePost.imageUrl,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
            Container(
              //! Contenedor de información
              height: size.height * 0.56 * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: radius,
                  bottomRight: radius
                ),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}