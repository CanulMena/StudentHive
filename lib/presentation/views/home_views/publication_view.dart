import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/publication/publication_screen.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/publication_container.dart';

class PublicationsView extends StatelessWidget {
  final List<Publication> listPublicationProvider;
  const PublicationsView({super.key, required this.listPublicationProvider,});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount:  listPublicationProvider.length,
      itemBuilder: (context, index) {
        final Publication publicationPost = listPublicationProvider[index];
        return Column( //*Ya lo pocisiona en el centro del espacio disponible
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),  
              child: PublicationContainer(
                navigateToPublication: const PublicationScreen(),
                publicationPost: publicationPost,
              ),
            ),
          ],
        );
      },
    );
  }
}
