import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/information/selected_publication_screen.dart';
import 'package:studenthive/presentation/screens/widgets/shared/widgets/publication/publication_container.dart';

class PublicationView extends StatelessWidget {
  final List<Publication> listPublicationProvider;
  const PublicationView({super.key, required this.listPublicationProvider,});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: listPublicationProvider.length,
      itemBuilder: (context, index) {
        final Publication imagePost = listPublicationProvider[index];
        return Column( //? No se porque antes tenía puesto un Row XD pero por cualquier cosa pongo este comentarío por si pasa algo :)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),  
              child: PublicationContainer(
                navegateToPublication: const SelectedPublication(),
                imagePost: imagePost, //imagePost contiene el numero index de la lista de provider - La lista de provider contiene una entidade de publication
              ),
            ),
          ],
        );
      },
    );
  }
}
