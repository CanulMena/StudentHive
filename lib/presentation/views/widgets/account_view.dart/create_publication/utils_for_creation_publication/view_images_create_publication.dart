import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class ViewImages extends StatelessWidget {
  final List<XFile> imageFileList;
  final PageController pageController;

  const ViewImages({super.key, required this.pageController, required this.imageFileList});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;        
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const TitleAppbar(title: '¿Tus imágenes están listas?'),

              const SizedBox(height: 10,),
              
                ContainerImages(
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.3,
                  image: imageFileList[1],
                ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i <= 2; i++)
                    SizedBox(
                      width: screenSize.width * 0.45,
                      height: screenSize.height * 0.2,
                      child: ContainerImages(
                        image: imageFileList.length > i ? imageFileList[i] : null,
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.45,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.1,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey),
                    ),
                  ),
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

              const SizedBox(height: 20,),

              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: screenSize.width * 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP(
            pageController: pageController, 
            isButtonEnabled: true,
            onNext: () {},
            );
        },
      ),
    );
  }
}

class ContainerImages extends StatelessWidget {
  final double width;
  final double height;
  final XFile? image;

  const ContainerImages({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      width: width,
      height: height,
      child: image != null
          ? Image.file(
              File(image!.path),
              fit: BoxFit.cover,
            )
          : const Center(child: Icon(Icons.image)),
    );
  }
}
