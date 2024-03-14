import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class AddHouseImages extends ConsumerStatefulWidget {
  final void Function(ImageSource) addHouseImages;
  final PageController pageController;
  const AddHouseImages({ 
    super.key, 
    required this.pageController, 
    required this.addHouseImages,
    });

  @override
  ConsumerState<AddHouseImages> createState() => _AddHouseImagesState();
}

class _AddHouseImagesState extends ConsumerState<AddHouseImages> {

  @override
  Widget build(BuildContext context,) {
    Size screenSize = MediaQuery.of(context).size;
    bool isButtonEnabled = ref.watch(imagesHouseProvider.select((state) => state.isButtonEnabled));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const TitleAppbar(
                title:'Da a conocer tu espacio'
                ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  'Agrega fotos de tu espacio para que los visitantes puedan verlo antes de reservar.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20,),

              SizedBox( // This is the gallery button
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
                    widget.addHouseImages(ImageSource.gallery);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Text('Agregar fotos', style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: screenSize.height * 0.03,
              ),

              SizedBox( // This is the camera button
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.grey))),
                  onPressed: () {
                    widget.addHouseImages(ImageSource.camera);
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: screenSize.width * 0.2,
                  ),
                ),
              )

              //todo: add the images to the screen


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
            isButtonEnabled: isButtonEnabled, 
            onNext: () {},
          );
        },
      ),
    );
  }

}
