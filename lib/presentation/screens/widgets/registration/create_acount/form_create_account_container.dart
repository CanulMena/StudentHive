import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/user_provider.dart';
import 'package:studenthive/presentation/screens/widgets/registration/input_decoration.dart';

class FormularioContainer extends StatelessWidget {
  FormularioContainer({super.key});

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<UserProvider>();
    return Container( 
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildTextFormField(
              label: "Nombre",
              prefixIcon: const Icon(Icons.person, color: Color(0xFF159A9C)),
              validator: (value) => _validateField(value, "nombre"),
              controller: nameController
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Apellido",
              prefixIcon: const Icon(Icons.people, color: Color(0xFF159A9C)),
              validator: (value) => _validateField(value, "apellido"),
              controller: lastNameController
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Edad",
              prefixIcon: const Icon(Icons.numbers, color: Color(0xFF159A9C)),
              keyboardType: TextInputType.number,
              validator: (value) => _validateNumber(value, "edad"),
              controller: ageController
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Correo Electrónico",
              prefixIcon: const Icon(Icons.email, color: Color(0xFF159A9C)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => _validateEmail(value),
              controller: emailController
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Contraseña",
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
              obscureText: true,
              validator: (value) => _validatePassword(value),
              controller: passwordController
            ),
            // const SizedBox(height: 20),
            // _buildTextFormField(
            //   label: "Confirmar Contraseña",
            //   prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
            //   obscureText: true,
            //   validator: (value) => _validatePassword(value),
            // ),
            const SizedBox(height: 10),
            _buildCheckbox("Acepto los términos y condiciones"),
            _buildCheckbox("Acepto las políticas de privacidad"),
            const SizedBox(height: 10),
            _buildCreateAccountButton(context , loginProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required Icon prefixIcon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    required TextEditingController controller
  }) {
    final FocusNode focusNode = FocusNode();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorWidth: 1,
      cursorColor: Colors.black,
      autocorrect: false,
      decoration: InputDecorations2.inputDecoration2(//*Este es el textFormfield que cree para poder usar este.
        hintText: "", //Es el texto que aparece luego de hacer click en el textformfield
        labelText: label, //Esto es lo que aparece en la parte superior del textformfield
        prefixIcon: prefixIcon, //Este es el icon que aparece en la parte izquierda del textformfield.
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator, //*lo que escribio se lo devolverá a una funcion que lo validará.
      focusNode: focusNode,
      controller: controller,
      onTapOutside: (event) {
        focusNode.unfocus(); //*Esto es para que se cierre el form si toco afuera de la pantala
      },
      // onFieldSubmitted: (value){
      //   onValue(controller.value.text);
      //   controller.clear();

      // },
    );
  }

  Widget _buildCheckbox(String text) {
  return Container(
    constraints: const BoxConstraints(maxWidth: double.infinity),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: const Color(0xFF159A9C),
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(width: 5), // Espacio entre el checkbox y el texto
            Flexible(
              child: Text(
                text,
                style: const TextStyle(color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

  Widget _buildCreateAccountButton(BuildContext context, UserProvider loginProvider) { //Hasta que no termine de llenar todo no mandaré el post en la api.

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      disabledColor: Colors.indigo,
      color: const Color(0xFF159A9C),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: const Text(
          "Crear Cuenta",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onPressed: () {
        // Validar si los campos están vacíos
      if (nameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          ageController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        // Mostrar mensaje de error si algún campo está vacío
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todos los campos son obligatorios')),
        );
      } else {
        // Si todos los campos están completos, agregar usuario y redirigir a la pantalla de inicio de sesión
        loginProvider.addUser(
          nameController.text, 
          lastNameController.text,
          ageController.text,
          emailController.text,
          passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cuenta creada correctamente')),
        );
        context.push('/login');
      }
    },
  );
}

  String? _validateField(String? value, String fieldName) {
    if (value!.isEmpty) {
      return "El campo $fieldName no puede estar vacío";
    } else if (value.length < 3) {
      return "El $fieldName debe tener al menos 3 caracteres";
    } else {
      return null;
    }
  }

  String? _validateNumber(String? value, String fieldName) {
    final n = num.tryParse(value!);
    if (n == null) {
      return 'No es un número válido para $fieldName';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'El correo no es válido';
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "El campo de contraseña no puede estar vacío";
    } else if (value.length < 6) {
      return "La contraseña debe tener al menos 6 caracteres";
    } else {
      return null;
    }
  }
}
