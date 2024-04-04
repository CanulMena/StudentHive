import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:studenthive/presentation/provider/user/user_provider.dart';
import 'package:studenthive/presentation/screens/widgets/registration/input_decoration.dart';

class CreateProfileView extends StatefulWidget {
  final void Function(ImageSource) addProfileImage;
  const CreateProfileView({super.key, required this.addProfileImage});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  @override
  Widget build(BuildContext context) {
    // String currentOption = options[0];
    final size = MediaQuery.of(context).size;
    // final user = ref.read(userCreateProfileProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Completa tu perfil'),
        ),
        body: ListView(
          children: [
            Center(
              child: Container(
                width: size.width * 0.9,
                // height: size.height * 1.1,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.amberAccent,
                //   ),
                //   borderRadius: BorderRadius.circular(20),
                // ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(padding: const EdgeInsets.all(20)),
                    const CircleAvatar(
                      radius: 60,
                    ),

                    SizedBox(
                        // width: size.width * 0.9 * 0.1,
                        child: TextButton(
                      onPressed: () {
                        widget.addProfileImage(ImageSource.gallery);
                      },
                      child: const Icon(Icons.add_a_photo_outlined),
                    )),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: 'Nombre',
                      hintText: 'Escribe tu nombre', //! es como el placeholder
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                      // controller: nameController,
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: 'Apellido',
                      hintText:
                          'Escribe tu apellido', //! es como el placeholder
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su apellido';
                        }
                        return null;
                      },
                      // controller: lastNameContoller,
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: "Edad",
                      hintText: "Escribe tu edad", //! es como el placeholder
                      prefixIcon: const Icon(Icons.assignment_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                      // controller: ageController
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: 'Bibliografia',
                      hintText: 'Describete', //! es como el placeholder
                      prefixIcon: const Icon(Icons.assignment_ind_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su bibliografia';
                        }
                        return null;
                      },
                      // controller: biographyController
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: 'Numero de telefono',
                      hintText:
                          'Escribe tu numero de telefono', //! es como el placeholder
                      prefixIcon: const Icon(Icons.phone),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su numero de telefono';
                        }
                        return null;
                      },
                      // controller: phoneController
                    ),

                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    // ExpansionTile(
                    //   title: const Text('Genero'),
                    //   subtitle: const Text('Selecciona tu genero'),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   // iconColor: Colors.black,
                    //   children: <Widget>[
                    //     ListTile(
                    //       title: const Text('Hombre'),
                    //       leading: Radio(
                    //         value: options[0],
                    //         groupValue: currentOption,
                    //         onChanged: (value) {
                    //           // setState(() {
                    //           //   currentOption = value.toString();
                    //           // });
                    //         },
                    //       ),
                    //     ),
                    //     ListTile(
                    //       title: const Text('Mujer'),
                    //       leading: Radio(
                    //         value: options[1],
                    //         groupValue: currentOption,
                    //         onChanged: (value) {
                    //           // setState(() {
                    //           //   currentOption = value.toString();
                    //           // });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),

                    // Agrega más TextFormField aquí para más campos
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Guardar'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget builTextFormField({
    required String labelText,
    required String hintText,
    required Icon prefixIcon,
    String? Function(String?)? validator,
    // required TextEditingController controller,
  }) {
    return Form(
      child: TextFormField(
        decoration: InputDecorations.inputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        // controller: controller,
      ),
    );
  }
}
