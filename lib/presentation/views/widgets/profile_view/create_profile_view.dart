import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/registration/input_decoration.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

List<String> options = ['Masculino', 'Femenino', 'Otro'];

class _CreateProfileViewState extends State<CreateProfileView> {
  // final _formKey = GlobalKey<FormState>();
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    SizedBox(
                      height: size.height * 0.5 * 0.3,
                      width: size.width * 0.5 * 0.7,
                      child: ClipOval(
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.cover),
                      ),
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
                    ),
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
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                      labelText: 'Bibliografia',
                      hintText: 'Describete', //! es como el placeholder
                      prefixIcon: const Icon(Icons.assignment_ind_outlined),
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    builTextFormField(
                        labelText: 'Numero de telefono',
                        hintText:
                            'Escribe tu numero de telefono', //! es como el placeholder
                        prefixIcon: const Icon(Icons.phone)),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),
                    ExpansionTile(
                      title: const Text('Genero'),
                      subtitle: const Text('Selecciona tu genero'),
                      controlAffinity: ListTileControlAffinity.leading,
                      // iconColor: Colors.black,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Hombre'),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Mujer'),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.5 * 0.1,
                    ),

                    // Agrega más TextFormField aquí para más campos
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        //   // Si el formulario es válido, muestra un snackbar
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Procesando Datos')),
                        //   );
                        // }
                      },
                      child: const Text('Guardar'),
                    ),
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
  }) {
    return Form(
      child: TextFormField(
        decoration: InputDecorations.inputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
