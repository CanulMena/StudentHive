import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/image_container.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/information_container.dart';

class MyPublicationsListView extends StatefulWidget {
  final List<HousePreview> activeHouses;
  final VoidCallback? nextHouses;
  const MyPublicationsListView({super.key, required this.activeHouses, required this.nextHouses});

  @override
  State<MyPublicationsListView> createState() => _MyPublicationsListViewState();
}

class _MyPublicationsListViewState extends State<MyPublicationsListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() { 
      if (widget.nextHouses == null) return;
      if(scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent){
        widget.nextHouses!();
      }
    });    
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 300));
          widget.nextHouses!();
        },
        edgeOffset: 2,
        strokeWidth: 2,
        child: ListView.builder(
          controller: scrollController,
          itemCount: widget.activeHouses.length,
          itemBuilder: (context, index) {
            final house = widget.activeHouses[index];
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
      ),
    );
  }
}
