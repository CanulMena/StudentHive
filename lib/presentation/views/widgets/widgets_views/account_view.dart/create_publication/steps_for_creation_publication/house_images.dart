import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class AddHouseImages extends StatelessWidget {
  const AddHouseImages({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleAppbar(
            title:
                'Da a conocer tu espacio'), //? clase que se encuentra en el archivo container_title_appbar.dart
        _message('Al principio, toma 3 fotos estos lo puedes cambiar despues'),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.1,
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey))),
            onPressed: () {},
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                ),
                SizedBox(
                  width: 40,
                ),
                Text('Agregar fotos', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.07,
        ),
        SizedBox(
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey))),
            onPressed: () {},
            child: Column(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: screenSize.width * 0.2,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _message(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
        message,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
