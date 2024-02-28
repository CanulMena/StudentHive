import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/create_publication_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseLocation extends StatelessWidget {
  final PageController pageController;
  
  const HouseLocation({
    Key? key,  
    required this.pageController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreatePublicationProvider createPublicationProvider = context.watch<CreatePublicationProvider>();
    bool isButtonEnabled = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TitleAppbar(
                title: '¿Cuál es la ubicación de tu espacio?',
              ),
              ContainerFormLocation(
                onFieldChanged: (pc, co, ci, st, ad, ne, isb) {
                  createPublicationProvider.postalCode = pc;
                  createPublicationProvider.country = co;
                  createPublicationProvider.city = ci;
                  createPublicationProvider.state = st;
                  createPublicationProvider.address = ad;
                  createPublicationProvider.neighborhood = ne;
                  isButtonEnabled = isb;
                },
              ),              
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP(
            pageController: pageController, 
            isButtonEnabled: isButtonEnabled,
            );
        },
      ),
    );
  }
}

class ContainerFormLocation extends StatefulWidget {
  final Function(String, String, String, String, String, String, bool) onFieldChanged; //estoy enviando una funcion


  const ContainerFormLocation({ super.key, required this.onFieldChanged});

  @override
  State<ContainerFormLocation> createState() => _ContainerFormLocationState();
}

class _ContainerFormLocationState extends State<ContainerFormLocation> {

  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      isButtonEnabled = postalCodeController.text.isNotEmpty &&
          countryController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          stateController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          neighborhoodController.text.isNotEmpty;
    });
  }

  void _addListeners() {
    postalCodeController.addListener(_checkFields);
    countryController.addListener(_checkFields);
    cityController.addListener(_checkFields);
    stateController.addListener(_checkFields);
    addressController.addListener(_checkFields);
    neighborhoodController.addListener(_checkFields);
  }

  void _removeListeners() {
    postalCodeController.removeListener(_checkFields);
    countryController.removeListener(_checkFields);
    cityController.removeListener(_checkFields);
    stateController.removeListener(_checkFields);
    addressController.removeListener(_checkFields);
    neighborhoodController.removeListener(_checkFields);
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
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildTextField(
                controller: countryController,
                label: 'Pais',
              ),
              buildTextField(
                controller: postalCodeController,
                label: 'Codigo Postal',
                inputFormatter: FilteringTextInputFormatter.digitsOnly,
                keyboardType: TextInputType.number,
              ),
              buildTextField(
                controller: stateController,
                label: 'Estado',
              ),
              buildTextField(
                controller: cityController,
                label: 'Ciudad',
              ),
              buildTextField(
                controller: neighborhoodController,
                label: 'Colonia',
              ),
              buildTextField(
                controller: addressController,
                label: 'Direccion',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    TextInputFormatter? inputFormatter,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter != null ? [inputFormatter] : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onChanged: (_) {
          // Llama a la función de devolución de llamada cada vez que cambia el texto
          widget.onFieldChanged(
            postalCodeController.text,
            countryController.text,
            cityController.text,
            stateController.text,
            addressController.text,
            neighborhoodController.text,
            isButtonEnabled
          );
        },
      ),
    );
  }
}
