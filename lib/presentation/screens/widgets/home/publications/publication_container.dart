import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/screens/widgets/auth_register_dialog.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/image_container.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/information_container.dart';

class PublicationContainer extends StatefulWidget {
  final HousePreview housePreview; 

  const PublicationContainer({
    super.key, 
    required this.housePreview,  
    });

  @override
  State<PublicationContainer> createState() => _PublicationContainerState();
}

class _PublicationContainerState extends State<PublicationContainer> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(

      onTap: (){
        context.push('/house/${widget.housePreview.idPublication}' );
      },
      
      child: Stack(
        children: [

          Container(//this box have the boxshadow
          //! Publication container
          height: size.height * 0.51, 
          width: size.width * 0.86,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              ImageContainer( imagesHousePreview: widget.housePreview.images,),
              InformationContainer(informationHousePreview: widget.housePreview,)
              ],
            ),
          ),

          const Positioned(
            top: 15,
            right: 20,
            child: Icon(Icons.favorite, color: Color.fromARGB(255, 126, 124, 109), size: 25,)
            ),

          Positioned(
            top: 15,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() { //TODO: validar isTokenAuth
                  // if( authProvider.isLogged){
                  //   isLiked = !isLiked;
                  //   isLiked 
                  //   ? favoriteProvider.addFavorites(widget.publicationsPost) 
                  //   : favoriteProvider.deleteFavorites(widget.publicationsPost);
                  // } else {
                  //   DialogUtils.openDialog(context, authProvider, /* userProvider */);
                  // }
                  }
                    );
                },
              child: Icon(
                isLiked 
                ? Icons.favorite 
                : Icons.favorite_border,
                color: isLiked ? Colors.yellow.shade800 : const Color.fromARGB(255, 233, 228, 228),
                size: 25,
              ),
            )
          ),

        ]
      ),
    );
  }
}
