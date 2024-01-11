import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/config/router/app_router.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/registration/input_decoration.dart';

class LogginFormContainer extends StatelessWidget {
  const LogginFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            buildTextFormField(
              labelText: "Usuario",
              hintText: "ejemplo@gmail.com",
              prefixIcon: const Icon(Icons.person, color: Color(0xFF159A9C)),
              validator: (value) {
                return validateEmail(value);
              },
            ),

            const SizedBox(height: 30),

            buildTextFormField(
              labelText: "Contraseña",
              hintText: "********",
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
              isPassword: true,
              validator: (value) {
                return validatePassword(value);
              },
            ),

            const SizedBox(height: 30),

            buildMaterialButton(
              label: "Ingresar",
              onPressed: () {
                isLogged = true;
                context.go('/home');
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

  String? validateEmail(String? value) {
    const pattern =
        r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'El correo no es válido';
  }

  String? validatePassword(String? value) {
    return (value != null && value.length >= 6) ? null : 'La contraseña debe tener al menos 6 caracteres';
  }
}
