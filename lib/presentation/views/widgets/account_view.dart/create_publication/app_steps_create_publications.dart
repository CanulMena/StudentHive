import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/screen_create_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/steps_for_creation_publication/house_detail_single.dart';

class AppStepsCreatePublications extends ConsumerStatefulWidget {

  final String typeHouseRental;

  const AppStepsCreatePublications({super.key, required this.typeHouseRental});

  @override
  ConsumerState<AppStepsCreatePublications> createState() => _AppStepsCreatePublicationsState();
}

class _AppStepsCreatePublicationsState extends ConsumerState<AppStepsCreatePublications> {
  final PageController pageController = PageController();

  int price = 0;
  double currentPage = 0;
  bool isUploading = false;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //! Every time the widget is built the request it makes the request to the provider
    final addHouseImages = ref.read(imagesHouseProvider.notifier).addImage;
    final removeHouseImage = ref.read(imagesHouseProvider.notifier).removeImage;

    final imageFileList = ref.read(imagesHouseProvider).images;
    final postalCode = ref.read(locationHouseProvider).postalCode;
    final country = ref.read(locationHouseProvider).country;
    final city = ref.read(locationHouseProvider).city;
    final state = ref.read(locationHouseProvider).state;
    final address = ref.read(locationHouseProvider).address;
    final neighborhood = ref.read(locationHouseProvider).neighborhood;

    final isWifiAvailable = ref.read(houseServicesProvider).isWifiAvailable;
    final isKitchenAvailable = ref.read(houseServicesProvider).isKitchenAvailable;
    final isWasherAvailable = ref.read(houseServicesProvider).isWasherAvailable;
    final isTvAvailable = ref.read(houseServicesProvider).isTvAvailable;
    final isAirConditionerAvailable = ref.read(houseServicesProvider).isAirConditionerAvailable;
    final isWaterAvailable = ref.read(houseServicesProvider).isWaterAvailable;
    final isGasAvailable = ref.read(houseServicesProvider).isGasAvailable;

    final numberOfBathrooms = ref.read(detailHouseProvider).numberOfBathrooms;
    final numberOfVisitors = ref.read(detailHouseProvider).numberOfVisitors;
    final numberOfHammocks = ref.read(detailHouseProvider).numberOfHammocks;
    final numberOfBeds = ref.read(detailHouseProvider).numberOfBeds;

    final title = ref.read(titleHouseProvider);

    final description = ref.read(descriptionHouseProvider);

    final whoElse = ref.read(whoElseProvider);
  

    final postHouse = ref.read(housesRepositoryProvider).postHouse;
    final onRefresh = ref.read(allHousesPreviewProvider.notifier).refreshData;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final go = context.go;
    final pop = context.pop;
    return isUploading ? const Scaffold( body: Center(child: CircularProgressIndicator()),) : Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: StepProgess(currentStep: currentPage, steps: 9),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [

                HouseLocation(
                  pageController: pageController,
                ),

                DetailsSingleHouse(
                  pageController: pageController, 
                  ),
                  
                WhoElse(
                  pageController: pageController,
                ),

                HouseService(
                  pageController: pageController,
                ),
  
                AddHouseImages(
                  pageController: pageController,
                  addHouseImages: addHouseImages,
                  removeHouseImage: removeHouseImage,
                ),

                HouseAddTittle(
                  pageController: pageController,
                ),

                HouseAddDescription(
                  pageController: pageController,
                ),
                HousePrice(
                  pageController: pageController,
                
                  onNext: (p) async {
                    price = p;
                    setState(() {
                      isUploading = true;
                    });
                    try{
                      await postHouse(
                      postalCode: postalCode,
                      country: country,
                      city: city,
                      state: state,
                      address: address,
                      neighborhood: neighborhood,
                      description: description,
                      gas: isGasAvailable,
                      airConditioning: isAirConditionerAvailable,
                      imagePaths: imageFileList.map((e) => e.path).toList(), //This is the list of images done by the user
                      kitchen: isKitchenAvailable,
                      numberOfBathrooms: numberOfBathrooms,
                      numberOfGuests: numberOfVisitors,
                      numberOfHammocks: numberOfHammocks,
                      numberOfRooms: numberOfBeds,
                      title: title,
                      typeHouse: widget.typeHouseRental,
                      washer: isWasherAvailable,
                      water: isWaterAvailable,
                      wifi: isWifiAvailable,
                      idUser: 6,
                      rentPrice: price,
                      status: false,
                      television: isTvAvailable,
                      whoElse: whoElse,
                    );

                    scaffoldMessenger.showSnackBar(
                      const SnackBar(content: Text('Casa publicada con exito')),
                    );

                    ref.read(imagesHouseProvider.notifier).reset();
                    ref.read(locationHouseProvider.notifier).reset();
                    ref.read(houseServicesProvider.notifier).reset();
                    ref.read(detailHouseProvider.notifier).reset();
                    ref.read(titleHouseProvider.notifier).reset();
                    ref.read(descriptionHouseProvider.notifier).reset();
                    ref.read(priceHouseProvider.notifier).reset();
                    ref.read(whoElseProvider.notifier).resetWhoElse();
                    
                    go('/');

                    onRefresh();

                    }  catch (e) {
                      scaffoldMessenger.showSnackBar(
                        const SnackBar(content: Text('Error al publicar la casa')),
                      );

                    pop();
                    }
                    setState(() {
                    isUploading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
