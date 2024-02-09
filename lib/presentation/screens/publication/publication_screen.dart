import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/publication/bottom_publication.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/publication/customlistview_publication.dart';

class PublicationScreen extends StatelessWidget {
  final Publication publicationPost;
  const PublicationScreen({
    super.key,
    required this.publicationPost,
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
        BottomPublication(publicationPost: publicationPost)
      ],
    ));
  }
}

