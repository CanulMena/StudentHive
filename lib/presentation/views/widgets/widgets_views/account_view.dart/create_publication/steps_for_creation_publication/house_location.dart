import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseLocation extends StatelessWidget {
  const HouseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //? clase que se encuentra en el archivo container_title_appbar.dart
        TitleAppbar(
          title: '¿Cuál es la ubicación de tu espacio?',
        ),
        Column(
          children: [
            ContainerFormLocation(),
            SizedBox(height: 150),
          ],
        ),
      ],
    );
  }
}

class ContainerFormLocation extends StatefulWidget {
  const ContainerFormLocation({super.key});

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.6,
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
      ),
    );
  }
}
