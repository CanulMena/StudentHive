import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/publication/publication_screen.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/publication_container.dart';

class PublicationsView extends StatelessWidget {
  final List<Publication> listPublicationProvider;
  const PublicationsView({super.key, required this.listPublicationProvider,});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return homeProvider.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
      itemCount:  listPublicationProvider.length,
      itemBuilder: (context, index) {
        final Publication publicationPost = listPublicationProvider[index];
        return Column( //*El widget column ya lo pocisiona en el centro del espacio disponible
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
