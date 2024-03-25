import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/image_container_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/information_container_publication.dart';

class PublicationStatusTrue extends StatelessWidget {
  final List<HousePreview> activeHouses;
  const PublicationStatusTrue({super.key, required this.activeHouses});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: activeHouses.length,
        itemBuilder: (context, index) {
          final house = activeHouses[index];
          return Container( //* publication container
          padding: const EdgeInsets.symmetric( vertical: 15),
            height: size.height * 0.51,
            width: size.width * 0.86,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                MyPublicationsImageContainer( imageUrl: house.images[0], ),
                MyPublicationInformationContainer(informationHousePreview: house,)
              ],
            ),
          );
        },
      ),
    );
  }
}
