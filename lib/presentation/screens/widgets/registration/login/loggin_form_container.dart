import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:studenthive/presentation/provider/user/riverpod_user_provider.dart';
import 'package:studenthive/presentation/screens/widgets/registration/input_decoration.dart';
//!NO se por qu este form tiene muchos errores. Tenemos que arreglarlos
class LogginFormContainer extends ConsumerWidget {
  LogginFormContainer({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final go = context.go;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final loginProvider = ref.watch(loginUserProvider);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        child: Column(
          children: [
            buildTextFormField(
              labelText: "Email",
              hintText: "ejemplo@gmail.com",
              prefixIcon: const Icon(Icons.person, color: Color(0xFF159A9C)),
              // validator: (value) {
              //   return validateEmail(value);
              // },
              controller: emailController,
              
            ),

            const SizedBox(height: 30),

            buildTextFormField(
              labelText: "Contraseña",
              hintText: "********",
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
              isPassword: true,
              // validator: (value) {
              //   return validatePassword(value);
              // },
              controller:  passwordController,
              
            ),

            const SizedBox(height: 30),

              buildMaterialButton(
              label: "Ingresar",
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                if( email.isEmpty || password.isEmpty ){
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Todos los campos son obligatorios')),
                  ); 
                  return; //*Salir del metodo si hay campos vacios
                } 
                
                try {

                  await loginProvider(email, password);

                  scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('El inicio de sesion fue exitoso')), 
                  );

                  go('/');

                } catch( error ) {
                  scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('Erorr en el inicio de sesión')),);
                  throw Exception('Erro al iniciar sesion intentalo mas tarde. $error');
                  }

              },
            ),

            const SizedBox(height: 30),

            buildRegistrationLink(context),

          ],
        ),
      ),
    );
  }

  Widget buildTextFormField({
    
    required String labelText,
    required String hintText,
    required Icon prefixIcon,
    bool isPassword = false,
    String? Function(String?)? validator,
    required TextEditingController controller
  }) {
    return TextFormField(
      keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorWidth: 1,
      cursorColor: Colors.black,
      autocorrect: false,
      obscureText: isPassword,
      decoration: InputDecorations.inputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      controller: controller,
      onChanged: (value) {
        
      },
    );
  }

  Widget buildMaterialButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      disabledColor: Colors.indigo,
      color: const Color(0xFF159A9C),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget buildRegistrationLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes una cuenta?"),
        TextButton(
          onPressed: () {
            context.push('/createAccount');
          },
          child: const Text(
            "Registrate",
            style: TextStyle(
              color: Color(0xFF159A9C),

            ),
          ),
        ),
      ],
    );
  }

  // String? validateEmail(String? value) {
  //   const pattern =
  //       r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
  //   final regExp = RegExp(pattern);
  //   return regExp.hasMatch(value ?? '') ? null : 'El correo no es válido';
  // }

  // String? validatePassword(String? value) {
  //   return (value != null && value.length >= 6) ? null : 'La contraseña debe tener al menos 6 caracteres';
  // }
}
