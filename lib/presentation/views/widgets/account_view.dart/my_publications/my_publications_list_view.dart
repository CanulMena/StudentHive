import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/image_container.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/information_container.dart';

class MyPublicationsListView extends StatelessWidget {
  final List<HousePreview> activeHouses;
  const MyPublicationsListView({super.key, required this.activeHouses});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: activeHouses.length,
        itemBuilder: (context, index) {
          final house = activeHouses[index];
          return Column(
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GestureDetector(
                  onTap: () {
                    context.push('/house/${house.idPublication}');
                  },
                  child: Container( 
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      height: size.height * 0.51,
                      width: size.width * 0.86,
                      child: Column(
                        children: [
                          ImageContainer(imagesHousePreview: house.images,),
                          InformationContainer(informationHousePreview: house, )
                        ],
                      ),
                    ),
                ),
              ),
            ] 
          );
        },
      ),
    );
  }
}
