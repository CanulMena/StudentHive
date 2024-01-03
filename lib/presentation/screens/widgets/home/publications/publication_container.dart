import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/favorite_provider.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/image_container.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/information_container.dart';

class PublicationContainer extends StatefulWidget {
  final Publication publicationPost; 

  const PublicationContainer({
    super.key, 
    required this.publicationPost,  
    });

  @override
  State<PublicationContainer> createState() => _PublicationContainerState();
}

class _PublicationContainerState extends State<PublicationContainer> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final favoriteProvider = context.watch<FavoriteProvider>();

    return GestureDetector(

      onTap: (){
        context.push('/publication', extra: widget.publicationPost);
      },
      
      child: Stack(
        children: [

          Container(
          //! Publication container
          height: size.height * 0.56, 
          width: size.width * 0.86,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.grey,
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
              ImageContainer( imagePost: widget.publicationPost,),
              InformationContainer(informationPost: widget.publicationPost,)
              ],
            ),
          ),

          Positioned(
            top: 15,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                  isLiked ? favoriteProvider.addFavorites(widget.publicationPost) : favoriteProvider.deleteFavorites(widget.publicationPost);
                  });
                },
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
                size: 30,
              ),
              )
            )
        ]
      ),
    );
  }
}