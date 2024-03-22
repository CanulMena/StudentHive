import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/image_container_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/information_container_publication.dart';


//! Publication status true
class PublicationStatusTrue extends StatelessWidget {
  const PublicationStatusTrue({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      //! Publication container
      child: Container(
        height: size.height * 0.51,
        width: size.width * 0.86,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: const Column(
          children: [
            MyPublicationsImageContainer(),
            MyPublicationInformationContainer()
          ],
        ),
      ),
    );
  }
}
