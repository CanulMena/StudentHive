import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/publication_container.dart';

class PublicationsView extends StatelessWidget {
  final List<Publication> listPublications;
  const PublicationsView({super.key, required this.listPublications,});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.search)
          ),
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
          ),
        ],
      ),

      body: homeProvider.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
      itemCount:  listPublications.length,
      itemBuilder: (context, index) {
        final Publication publicationPost = listPublications[index];
        return Column( //*El widget column ya lo pocisiona en el centro del espacio disponible
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),  
              child: PublicationContainer(
                publicationPost: publicationPost,
              ),
            ),

          ],
        );
      },
    ),
    );
  }
}
