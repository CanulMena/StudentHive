import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/widgets/registration/input_decoration.dart';

class LogginFormContainer extends ConsumerStatefulWidget {
  const LogginFormContainer({super.key});

  @override
  ConsumerState<LogginFormContainer> createState() =>
      _LogginFormContainerState();
}

class _LogginFormContainerState extends ConsumerState<LogginFormContainer> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late String token;
  Map<String, dynamic> payload = {};

  @override
  void initState() {
    super.initState();
  }

  Map<String, dynamic> decodePayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token');
      }

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final resp = utf8.decode(base64Url.decode(normalized));
      final payloadMap = json.decode(resp);
      return payloadMap;
    } catch (e) {
      // print('Error decoding token: $e');
      return {}; // Devolver un mapa vacío en caso de error
    }
  }

  @override
  Widget build(BuildContext context) {
    final go = context.go;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final loginUser = ref.watch(loginUserProvider);
    final isTokenAuth = ref.watch(isTokenAuthProvider.notifier).isTokenAuth;
    final removeToken = ref.watch(isTokenAuthProvider.notifier).desavowToken;
    final adduser = ref.watch(userProvider.notifier).setUser;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        child: Column(
          children: [
            buildTextFormField(
              labelText: "Email",
              hintText: "ejemplo@gmail.com",
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(241, 159, 133, 0),
              ),
              controller: emailController,
            ),
            const SizedBox(height: 30),
            buildTextFormField(
              labelText: "Contraseña",
              hintText: "********",
              prefixIcon: const Icon(
                Icons.lock,
                color: Color.fromARGB(241, 159, 133, 0),
              ),
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 30),
            buildMaterialButton(
              label: "Ingresar",
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Todos los campos son obligatorios')),
                  );
                  return;
                }

                try {
                  await loginUser(email, password);

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  token = prefs.getString('Jwt') ?? '';
                  if (token.isNotEmpty) {
                    payload = decodePayload(token);
                  }

                  final String emailPayload = payload[
                      'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];

                  try {
                    await adduser(emailPayload);
                  } catch (e) {
                    throw Exception('Error al guardar el usuario');
                  }

                  await isTokenAuth();

                  scaffoldMessenger.showSnackBar(
                    const SnackBar(
                        content: Text('El inicio de sesion fue exitoso')),
                  );

                  go('/');
                } catch (error) {
                  removeToken();
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(
                        content: Text('Erorr en el inicio de sesión')),
                  );
                  throw Exception(
                      'Erro al iniciar sesion intentalo mas tarde. $error');
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
    required TextEditingController controller,
  }) {
    return TextFormField(
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
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
      onChanged: (value) {},
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
      color: const Color.fromARGB(255, 156, 134, 21),
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
              color: Color.fromARGB(255, 199, 184, 9),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
