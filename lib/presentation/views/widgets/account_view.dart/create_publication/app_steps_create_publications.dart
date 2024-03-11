import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/provider/house/house_repository_provider.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/screen_create_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/steps_for_creation_publication/house_detail_single.dart';

class AppStepsCreatePublications extends ConsumerStatefulWidget {

  final String typeHouseRental;

  const AppStepsCreatePublications(this.typeHouseRental, {super.key});

  @override
  ConsumerState<AppStepsCreatePublications> createState() => _AppStepsCreatePublicationsState();
}

class _AppStepsCreatePublicationsState extends ConsumerState<AppStepsCreatePublications> {
  final PageController pageController = PageController();

  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  String postalCode = '';
  String country = '';
  String city = '';
  String state = '';
  String address = '';
  String neighborhood = '';

  int numberOfVisitors = 0;
  int numberOfBeds = 0;
  int numberOfHammocks = 0;
  int numberOfBathrooms = 0;

  String whoElse = '';

  bool isWifiAvailable = false;
  bool isKitchenAvailable = false;
  bool isWasherAvailable = false;
  bool isTvAvailable = false;
  bool isAirConditionerAvailable = false;
  bool isWaterAvailable = false;
  bool isGasAvailable = false;

  List<XFile> imageFileList = [];

  String description = '';

  String title = '';

  int price = 0;

  @override
  Widget build(BuildContext context) {
    final postHouse = ref.read(housesRepositoryProvider).postHouse;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: StepProgess(currentStep: currentPage, steps: 10),
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
                  onNext: (pc, co, ci, st, ad, ne) {
                  setState(() {
                    postalCode = pc;
                    country = co;
                    city = ci;
                    state = st;
                    address = ad;
                    neighborhood = ne;
                    });
                  },
                ),

                DetailsSingleHouse(
                  pageController: pageController, 
                  onNext: (p0, p1, p2, p3) {
                    setState(() {
                      numberOfVisitors = p0;
                      numberOfBeds = p1;
                      numberOfHammocks = p2;
                      numberOfBathrooms = p3;
                    });
                  },
                  ),
                  
                WhoElse(
                  pageController: pageController,
                  onNext: (p0) {
                    whoElse = p0;
                  },
                ),

                HouseService(
                  pageController: pageController,
                  onNext: (p0, p1, p2, p3, p4, p5, p6) {
                    setState(() {
                      isWifiAvailable = p0;
                      isKitchenAvailable = p1;
                      isWasherAvailable = p2;
                      isTvAvailable = p3;
                      isAirConditionerAvailable = p4;
                      isWaterAvailable = p5;
                      isGasAvailable = p6;
                    });
                  },
                ),

                AddHouseImages(
                  pageController: pageController,
                  onNext: (p0) {
                    imageFileList = p0;
                  },
                ),

                ViewImages(
                  pageController: pageController,
                  imageFileList: imageFileList,
                ),
                HouseAddTittle(
                  pageController: pageController,
                  onNext: (p0) => title = p0,
                ),
                HouseAddDescription(
                  pageController: pageController,
                  onNext: (p0) {
                    description = p0;
                  },
                ),
                HousePrice(
                  pageController: pageController,
                  onNext: (p0) async {
                    price = int.parse(p0);
                    await postHouse(
                      address: address,
                      city: city,
                      country: country,
                      description: description,
                      gas: isGasAvailable,
                      airConditioning: isAirConditionerAvailable,
                      imagePaths: imageFileList.map((e) => e.path).toList(),
                      kitchen: isKitchenAvailable,
                      numberOfBathrooms: numberOfBathrooms,
                      numberOfGuests: numberOfVisitors,
                      numberOfHammocks: numberOfHammocks,
                      numberOfRooms: numberOfBeds,
                      postalCode: postalCode,
                      state: state,
                      title: title,
                      typeHouse: widget.typeHouseRental,
                      washer: isWasherAvailable,
                      water: isWaterAvailable,
                      wifi: isWifiAvailable,
                      idUser: 6,
                      neighborhood: neighborhood,
                      rentPrice: price,
                      status: false,
                      television: isTvAvailable,
                      whoElse: 'IAm',
                    );
                  },
                ),
                // MakeReservationView
              ],
            ),
          ),
        ],
      ),
    );
  }
}
