import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class AddHouseImages extends StatefulWidget {
  final Function(List<XFile>) onNext;
  final PageController pageController;
  const AddHouseImages({ super.key, required this.pageController, required this.onNext});

  @override
  State<AddHouseImages> createState() => _AddHouseImagesState();
}

class _AddHouseImagesState extends State<AddHouseImages> {
  final ImagePicker _picker = ImagePicker();

  final List<XFile> _imageFileList = [];

  dynamic pickImageError;
  bool isButtomEnable = false;
  int imageCount = 0; 

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleAppbar(
                title:'Da a conocer tu espacio'),
              _message('Al principio, toma 3 fotos estos lo puedes cambiar despues'),
              const SizedBox(height: 20,),
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
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.gallery);
                  },
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
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.camera);
                  },
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
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP( 
            pageController: widget.pageController,
            isButtonEnabled: isButtomEnable, 
            onNext: () {
              widget.onNext(_imageFileList);
            },
          );
        },
      ),
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

  _onImageButtonPressed(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFileList.add(pickedFile);
        });
        imageCount++;
        if (imageCount >= 3) {
          setState(() {
            isButtomEnable = true; // Habilita el botón cuando se agregan al menos 3 imágenes
          });
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        pickImageError = e;
      });
    }
  }
}
