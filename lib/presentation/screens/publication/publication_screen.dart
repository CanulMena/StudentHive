import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/publication/bottom_publication.dart'; //TODO: Refactorizar esto
import 'package:studenthive/presentation/screens/widgets/publication/customlistview_publication.dart';

class PublicationScreen extends StatelessWidget {
  final int idHouse;
  const PublicationScreen({
    super.key,
    required this.idHouse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: CustomListView(
          publicationPost: publicationPost,
        )),
        BottomPublication(publicationPost: publicationPost)//just to commit
      ],
    ));
  }
}

