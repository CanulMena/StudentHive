import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/create_publication_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HousePrice extends StatefulWidget {
  final PageController pageController;
  const HousePrice({super.key, required this.pageController});

  @override
  State<HousePrice> createState() => _HousePriceState();
}

class _HousePriceState extends State<HousePrice> {
  final TextEditingController priceController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      isButtonEnabled = priceController.text.isNotEmpty;
    });
  }

  void _addListeners() {
    priceController.addListener(_checkFields);
  }

  void _removeListeners() {
    priceController.removeListener(_checkFields);
  }

  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createPublicationProvider =
        context.watch<CreatePublicationProvider>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAppbar(title: 'Establece un precio para tu espacio'),
              _message(),
              Container(
                width: screenSize.width * 1,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: priceController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (value) {
                    createPublicationProvider.price = int.parse(
                        value); //este valor quiero que sea de tipo int y no de tipo string
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Center(
              //   child: IconButton.filled(
              //       onPressed: () {
              //         context.go('/home');
              //         createPublicationProvider.addPublication(RentalHouse(
              //             title: createPublicationProvider.title,
              //             description: createPublicationProvider.description,
              //             imagesf: createPublicationProvider.getListXFile,
              //             status: false,
              //             rentPrice: createPublicationProvider.price,
              //             typeHouseRental:
              //                 createPublicationProvider.typeHouseRental,
              //             publicationDate: DateTime.now(),
              //             houseService: HouseService(
              //                 wifi: createPublicationProvider.wifi,
              //                 kitchen: createPublicationProvider.kitchen,
              //                 washer: createPublicationProvider.washer,
              //                 airConditioning:
              //                     createPublicationProvider.airConditioning,
              //                 water: createPublicationProvider.washer,
              //                 gas: createPublicationProvider.gas,
              //                 television: createPublicationProvider.television),
              //             rentalHouseDetail: RentalHouseDetail(
              //                 numberOfGuests: createPublicationProvider.guests,
              //                 numberOfBathrooms:
              //                     createPublicationProvider.batrooms,
              //                 numberOfRooms: createPublicationProvider.rooms,
              //                 numberOfHammocks:
              //                     createPublicationProvider.hammocks),
              //             houseLocation: HouseLocation(
              //                 address: createPublicationProvider.address,
              //                 city: createPublicationProvider.city,
              //                 state: createPublicationProvider.state,
              //                 country: createPublicationProvider.country,
              //                 postalCode: createPublicationProvider.postalCode,
              //                 neighborhood: createPublicationProvider.neighborhood
              //                 ),
              //             // idUser: idUser
              //             ));
              //       },
              //       icon: const Icon(Icons.new_label)),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          // Mostrar el bottomNavigationBar solo si el teclado no está abierto
          return isKeyboardVisible
              ? const SizedBox()
              : ButtomStepscreateP(
                  pageController: widget.pageController,
                  isButtonEnabled: isButtonEnabled,
                );
        },
      ),
    );
  }

  Widget _message() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: const Text(
        'Se peude cambiar caundo tu quieras.',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
