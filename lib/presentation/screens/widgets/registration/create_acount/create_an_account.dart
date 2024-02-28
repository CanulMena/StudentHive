import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/registration/create_acount/form_create_account_container.dart';

class CreateAnAccountForm extends StatelessWidget {
  const CreateAnAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 155),
          Container(
            //!Contenedor principal del formulario
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
                  'Crear Cuenta',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                FormularioContainer(),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
