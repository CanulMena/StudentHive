import 'package:flutter/material.dart';

class AddImages extends StatelessWidget {
  const AddImages({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              'Da a conocer tu espacio',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const Text(
              'Al principio, toma 3 fotos y después si quieres, agregas más o las cambias',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
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
      ),
    );
  }
}
