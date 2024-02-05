import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/create_publication_detail_house.dart';

class CreatePublicationLocation extends StatelessWidget {
  const CreatePublicationLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '¿Cuál es la ubicación de tu espacio?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  const ContainerFormLocation(),
                  const SizedBox(height: 150),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(15)),
                      CustomNavBarButton(
                        label: 'Atras',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 100),
                      CustomNavBarButton(
                        label: 'Siguiente',
                        onPressed: () {
                          Navigator.of(context).push(
                            createPageRoute(const DetailsHouse()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
    return Padding(
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
