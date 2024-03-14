import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageState{
  final bool isButtonEnabled;
  final List<XFile> images;

  ImageState({required this.isButtonEnabled, required this.images});
}

final imagesHouseProvider = StateNotifierProvider<ImagesHouseProvider, ImageState>((ref) {
  return ImagesHouseProvider();
});

class ImagesHouseProvider extends StateNotifier<ImageState> {

  dynamic pickImageError;

  ImagesHouseProvider() : super(
    ImageState(
      isButtonEnabled: false, 
      images: []
      )
    );

  final ImagePicker _picker = ImagePicker();

  void addImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage( // This is the file picker
        source: source,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        state = ImageState(
          isButtonEnabled: state.images.length + 1 >= 3 ? true : false, 
          images: [...state.images, pickedFile],
          );
        
      }
    } catch (e) {
      debugPrint(e.toString());
      pickImageError = e;
    }
  }

  void removeImage(int index) {
  List<XFile> newImages = List.from(state.images); // Create a new list from the existing one
  newImages.removeAt(index); // Remove the image from the new list
  state = ImageState(
    isButtonEnabled: newImages.length >= 3 ? true : false, 
    images: newImages, // Update the state with the new list
    );
  }

  void reset(){
    state = ImageState(
      isButtonEnabled: false, 
      images: []
      );
  }

}
