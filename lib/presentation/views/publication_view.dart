import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/provider/home_provider.dart';
import 'package:studenthive/presentation/screens/widgets/shared/widgets/publication_container.dart';

class PublicationView extends StatelessWidget {
  const PublicationView({super.key,});

  @override
  Widget build(BuildContext context) {

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
              child: PublicationContainer(imagePost: imagePost),
            ),
          ],
        );
      },
    );
  }
}
