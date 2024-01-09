import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/registration/input_decoration.dart';

class FormularioContainer extends StatelessWidget {
  const FormularioContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //?Amarro todo el formulario en un contenedor que tedría todos los textFormField
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildTextFormField(
              label: "Nombre",
              prefixIcon: const Icon(Icons.person, color: Color(0xFF159A9C)),
              validator: (value) => _validateField(value, "nombre"),
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Apellido",
              prefixIcon: const Icon(Icons.people, color: Color(0xFF159A9C)),
              validator: (value) => _validateField(value, "apellido"),
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Edad",
              prefixIcon: const Icon(Icons.numbers, color: Color(0xFF159A9C)),
              keyboardType: TextInputType.number,
              validator: (value) => _validateNumber(value, "edad"),
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Correo Electrónico",
              prefixIcon: const Icon(Icons.email, color: Color(0xFF159A9C)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => _validateEmail(value),
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Contraseña",
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
              obscureText: true,
              validator: (value) => _validatePassword(value),
            ),
            const SizedBox(height: 20),
            _buildTextFormField(
              label: "Confirmar Contraseña",
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF159A9C)),
              obscureText: true,
              validator: (value) => _validatePassword(value),
            ),
            const SizedBox(height: 10),
            _buildCheckbox("Acepto los términos y condiciones"),
            _buildCheckbox("Acepto las políticas de privacidad"),
            const SizedBox(height: 10),
            _buildCreateAccountButton(context),
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
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorWidth: 1,
      cursorColor: Colors.black,
      autocorrect: false,
      decoration: InputDecorations2.inputDecoration2(
        hintText: "",
        labelText: label,
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
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


  Widget _buildCreateAccountButton(BuildContext context) {
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
        context.push('/login');
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
