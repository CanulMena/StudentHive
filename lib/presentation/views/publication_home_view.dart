import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';

class HomeView extends StatelessWidget {
  
  const HomeView({super.key,});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Radius radius = Radius.circular(20);

    final homeProvider = context.watch<HomeProvider>();
    final List<Publication> listPublicationProvider = homeProvider.publications;//

    return ListView.builder(
      itemCount: listPublicationProvider.length,
      itemBuilder: (context, index) {
        final Publication imagePost = listPublicationProvider[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),  
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
            ),
          ],
        );
      },
    );
  }
}
