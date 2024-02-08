import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class ViewImages extends StatelessWidget {
  const ViewImages({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          //? clase que se encuentra en el archivo container_title_appbar.dart
          const TitleAppbar(title: '¿Tus imagenes estan listas?'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.3,
              child: ContainerImanges(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.9,
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: screenSize.width * 0.45,
                  height: screenSize.height * 0.2,
                  child: ContainerImanges(
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.45,
                  )),
              SizedBox(
                  width: screenSize.width * 0.45,
                  height: screenSize.height * 0.2,
                  child: ContainerImanges(
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.45,
                  )),
            ],
          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                  ),
                  Text('Agregar más fotos', style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
      ),
    );
  }
}

class ContainerImanges extends StatefulWidget {
  const ContainerImanges({
    super.key,
    required this.width,
    required this.height,
    // required this.urlImage
  });

  final double width;
  final double height;
  // final String urlImage;

  @override
  State<ContainerImanges> createState() => _ContainerImangesState();
}

class _ContainerImangesState extends State<ContainerImanges> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      width: size.width,
      height: size.height,
      // child: Image.network(
      //   widget.urlImage,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
