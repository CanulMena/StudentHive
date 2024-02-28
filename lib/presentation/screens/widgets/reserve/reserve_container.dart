import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/reserve_provider.dart';

class ReserveContainer extends StatelessWidget {
  final RentalHouse publicationReserved;
  final ReserveProvider reserveProvider;
  const ReserveContainer({
    super.key, 
    required this.publicationReserved, 
    required this.reserveProvider
    });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
    //!Reserve container
    alignment: Alignment.center,
    height: size.height * .20,
    width: size.width * .95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:    const Color.fromARGB(255, 0, 79, 122),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),  // Color de la sombra
          spreadRadius: 6,  // Distancia de la propagación de la sombra
          blurRadius: 8,  // Radio del desenfoque de la sombra
          offset: const Offset(0, 3),  // Desplazamiento de la sombra
          ),
        ],
    ),
        child: Row( 
          children: [
            Container(
              //!Image container
              padding: const EdgeInsets.all(5),
              height: size.height * .20 * 100,
              width: size.width * .95 * .40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.blue
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Image.network(
                //   publicationReserved.imagenes,
                //   width: double.infinity,
                //   height: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),

            Container(
            //!Information container
              padding: const EdgeInsets.all(5),
              height: size.height * .20 * 100,
              width: size.width * .95 * .45,
              decoration: const BoxDecoration(
                // color: Colors.green
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    publicationReserved.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '\$${publicationReserved.rentPrice}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    publicationReserved.idUser,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              )
            ),
            //!Delete Publication
            IconButton(
              onPressed: () {
                reserveProvider.deleteReservation(publicationReserved);
              },
              color: Colors.white,
              icon: const Icon(
                Icons.clear
              )),
          ],
        ),
      );

  }
}
