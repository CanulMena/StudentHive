import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/entities.dart';

class RequestViewGuess extends StatelessWidget {
  final List<YourRequest> yourRequests;
  final Future<void> Function(int) removeRequest;

  const RequestViewGuess({
    super.key, 
    required this.yourRequests, 
    required this.removeRequest
    });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(yourRequests.length, (index) {
      final yourRequest = yourRequests[index];
      return GestureDetector(
        onTap: () => context.push('/my-publication-request/${yourRequest.idPublication}'),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          //! contenido del contenedor de la solicitud (Contendor principal)
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.20,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                //! Contenedor de la imagen
                Container(
                  padding: const EdgeInsets.all(5),
                  height: size.height * 0.20 * 100,
                  width: size.width * 0.95 * 0.45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      yourRequest.image ?? '',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //! Contenedor de la información
                Container(
                  padding: const EdgeInsets.all(5),
                  height: size.height * 0.20 * 100,
                  width: size.width * 0.95 * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        yourRequest.title ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$${yourRequest.rentPrice}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(yourRequest.userName ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.95 * 0.10,
                  child: IconButton(
                    onPressed: () {
                      try {
                        removeRequest(yourRequest.idRequest!);
                      } catch (e) {
                        // Manejar la excepción aquí
                      }
                    },
                    icon: const Icon(Icons.clear),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
