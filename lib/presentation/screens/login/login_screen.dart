import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/login/create_acount_screen.dart';
import 'package:studenthive/presentation/screens/home/home_screen.dart';
import 'package:studenthive/presentation/screens/widgets/login/blue_box.dart';
import 'package:studenthive/presentation/screens/widgets/login/input_decoration.dart';
import 'package:studenthive/presentation/screens/widgets/login/hive_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(//? este size box es creado para ocupar toda la pantalla
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            BlueBox(boxHeigh: size.height * 0.6, circularRadius: 200),//Primero colocamos la parte mas inferior - Pues aca estará el fondo
            HiveIcon(size: size.height * 0.001, iconSize: 200), //el logo arriba del fondo
            loginForm(context),
          ],
        ),
      ),
    );
  }

  // Método para construir el formulario de inicio de sesión
  SingleChildScrollView loginForm(BuildContext context) {
    return SingleChildScrollView(

      child: Column(

        children: [

          const SizedBox(height: 250),

          Container(//!Principal container
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column( 
              children: [

                const SizedBox(height: 10),

                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),
                
                Container(//!TextFormField container
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(//indicamos que crearemos formularios
                    child: Column(
                      children: [

                        TextFormField(
                            //Esto es para que puedas ingresar el correo
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorWidth: 1,
                            cursorColor: Colors.black,
                            autocorrect: false,
                            decoration: InputDecorations.inputDecoration(
                                labelText: "Usuario",
                                hintText: "ejemplo@gmail.com",
                                prefixIcon: const Icon(Icons.person,
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

                          const SizedBox(height: 30),

                          TextFormField(
                            //Esto es para que puedas ingresar la contraseña
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorWidth: 1,
                            cursorColor: Colors.black,
                            autocorrect: false,
                            decoration: InputDecorations.inputDecoration(
                                hintText: "********",
                                labelText: "Contraseña",
                                prefixIcon: const Icon(Icons.lock,
                                    color: Color(0xFF159A9C))),
                            validator: (value) {
                              return (value != null && value.length >= 6)
                                  ? null
                                  : 'La contraseña debe de ser de 6 caracteres';
                            },
                          ),
                          //Boton
                        const SizedBox(height: 30),

                        MaterialButton(//?Indicamos el boton
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          disabledColor: Colors.indigo,
                          color: const Color(0xFF159A9C),
                          child: Container(//Como se verá el boton por dentro
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            child: const Text(
                              "Ingresar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HomeScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 30),

                        Row(//? Enlace para registrarse
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Text("¿No tienes una cuenta?"),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAnAccountScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Registrate",
                                style: TextStyle(
                                  color: Color(0xFF159A9C),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//TODO: TERMINAR DE OPTIMIZAR EL CODIGO