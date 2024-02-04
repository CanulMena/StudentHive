import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';

class CreatePublicationLocation extends StatelessWidget {
  const CreatePublicationLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
              leading: ButtonBar(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              title: const Text('Describe lo mejor que puedas tu lugar')),
        ),
        body: Center(
            child: ListView(children: [
          Column(
            children: [
              const ContainerFormLocation(),
              const SizedBox(height: 130),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  CustomNavBarButton(
                      label: 'Atras',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 100),
                  CustomNavBarButton(
                    label: 'Siguiente',
                    onPressed: () {
                      Navigator.of(context).push(
                          createPageRoute(const CreatePublicationLocation()));
                    },
                  )
                ],
              )
            ],
          ),
        ])));
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
  final TextEditingController neighoboordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: countryController, label: 'Pais'),
            buildTextField(
              controller: postalCodeController,
              label: 'Codigo Postal',
              inputFormatter: FilteringTextInputFormatter.digitsOnly,
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
              controller: neighoboordController,
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
    TextInputFormatter? inputFormatter,
  }) {
    TextInputType keyboardType = TextInputType.text;
    if (label == 'Codigo Postal') {
      keyboardType = TextInputType.number;
    }

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
