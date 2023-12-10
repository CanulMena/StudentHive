import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/login/login_screen.dart';
import 'package:studenthive/presentation/screens/widgets/login/blue_box.dart';
import 'package:studenthive/presentation/screens/widgets/login/hive_icon.dart';
import 'package:studenthive/presentation/screens/widgets/login/input_decoration.dart';

class CreateAnAccountScreen extends StatelessWidget {
  const CreateAnAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            BlueBox(boxHeigh: size.height * 0.8, circularRadius: 100),
            HiveIcon(size: size.height * 0.01, iconSize: 100),
            createAnAccountForm(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView createAnAccountForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 150),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            // height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(children: [
              const SizedBox(height: 10),
              const Text('Crear Cuenta',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  child: Column(children: [
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorWidth: 1,
                        cursorColor: Colors.black,
                        autocorrect: true,
                        decoration: InputDecorations2.inputDecoration2(
                            hintText: "",
                            labelText: "Nombre",
                            prefixIcon: const Icon(Icons.person,
                                color: Color(0xFF159A9C))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "El campo no puede estar vacio";
                          } else if (value.length < 3) {
                            return "El nombre debe tener al menos 3 caracteres";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecorations2.inputDecoration2(
                          hintText: "",
                          labelText: "Apellido",
                          prefixIcon: const Icon(Icons.people,
                              color: Color(0xFF159A9C))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio";
                        } else if (value.length < 3) {
                          return "El nombre debe tener al menos 3 caracteres";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecorations2.inputDecoration2(
                          hintText: "",
                          labelText: "Edad",
                          prefixIcon: const Icon(Icons.numbers,
                              color: Color(0xFF159A9C))),
                      validator: (value) {
                        //solamente numeros
                        final n = num.tryParse(value!);
                        if (n == null) {
                          return 'No es un numero valido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecorations2.inputDecoration2(
                          hintText: "",
                          labelText: "Correo Electronico",
                          prefixIcon: const Icon(Icons.email,
                              color: Color(0xFF159A9C))),
                      validator: (value) {
                        String pattern =
                            //expreciones regulares
                            r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                            ? null
                            : 'El correo no es valido';
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecorations2.inputDecoration2(
                          hintText: "",
                          labelText: "Contraseña",
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFF159A9C))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio";
                        } else if (value.length < 6) {
                          return "La contraseña debe tener al menos 6 caracteres";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecorations2.inputDecoration2(
                          hintText: "",
                          labelText: "Confirmar Contraseña",
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFF159A9C))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El campo no puede estar vacio";
                        } else if (value.length < 6) {
                          return "La contraseña debe tener al menos 6 caracteres";
                        } else {
                          return null;
                        }
                      },
                      //validar que las contraseñas sean iguales
                      

                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          activeColor: const Color(0xFF159A9C),
                          onChanged: (value) {
                            // setState(() {
                            //   _isChecked = value!;
                            // });
                          },
                        ),
                        const Text(
                          "Acepto los terminos y condiciones",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: const Color(0xFF159A9C),
                          value: false,
                          onChanged: (value) {},
                        ),
                        const Text(
                          "Acepto las politicas de privacidad",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      disabledColor: Colors.indigo,
                      color: const Color(0xFF159A9C),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        child: const Text(
                          "Crear Cuenta",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                      },
                    ),
                  ]),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
