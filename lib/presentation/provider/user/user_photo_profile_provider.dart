import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageStateUser {
  // final bool isButtonEnabled;
  final XFile image;

  ImageStateUser({required this.image});
}

final imageUserProvider = StateNotifierProvider<ImageUserProvider, ImageStateUser>((ref) {
  return ImageUserProvider();
});

class ImageUserProvider extends StateNotifier<ImageStateUser> {
  dynamic pickImageError;

  ImageUserProvider() : super(
    ImageStateUser(
      // isButtonEnabled: false, 
      image: XFile('')
      )
    );
  
  final ImagePicker _picker = ImagePicker();

  void addImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        state = ImageStateUser(
          // isButtonEnabled: state.images.length + 1 >= 3 ? true : false, 
          image: pickedFile,
          );
        
      }
    } catch (e) {
      debugPrint(e.toString());
      pickImageError = e;
    }
  }

  void removeImage() {
    state = ImageStateUser(
      // isButtonEnabled: newImages.length >= 3 ? true : false, 
      image: XFile(''),
      );
  }

  void reset(){
    state = ImageStateUser(
      // isButtonEnabled: false, 
      image: XFile('')
      );
  }
}