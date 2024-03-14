import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/image_container.dart';

class AddHouseImages extends ConsumerStatefulWidget {
  final void Function(ImageSource) addHouseImages;
  final void Function(int) removeHouseImage;
  final PageController pageController;
  const AddHouseImages({ 
    super.key, 
    required this.pageController, 
    required this.addHouseImages,
    required this.removeHouseImage
    });

  @override
  ConsumerState<AddHouseImages> createState() => _AddHouseImagesState();
}

class _AddHouseImagesState extends ConsumerState<AddHouseImages> {

  @override
  Widget build(BuildContext context,) {
    Size screenSize = MediaQuery.of(context).size;
    bool isButtonEnabled = ref.watch(imagesHouseProvider.select((state) => state.isButtonEnabled));
    List<XFile> imageFileList = ref.watch(imagesHouseProvider.select((state) => state.images));
    
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

            if( imageFileList.isNotEmpty ) ...[

              ContainerImages( // This is the main image, the one that is bigger
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.3,
                image: imageFileList[0],
              ),

              const SizedBox( height: 20,),

              GridView.count(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 1, // Aspect ratio of each item
              shrinkWrap: true, // If true, the extent of the scroll view in the scrollDirection is determined by the contents being viewed
              physics: const NeverScrollableScrollPhysics(), // Disables scrolling in the GridView
              children: imageFileList.skip(1).map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0), // Add some padding around each image
                  child: ContainerImages(
                    image: e,
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.45,
                    ),
                  );
                }).toList(),
              ),

            ],

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
            pageController: widget.pageController,
            isButtonEnabled: isButtonEnabled, 
            onNext: () {},
          );
        },
      ),
    );
  }

}
