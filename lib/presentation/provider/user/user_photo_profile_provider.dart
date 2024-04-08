import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ImageStateUser {
  final XFile image;
  ImageStateUser({required this.image});
}

final imageUserProvider =
    StateNotifierProvider<ImageUserProvider, ImageStateUser>((ref) {
  return ImageUserProvider();
});

class ImageUserProvider extends StateNotifier<ImageStateUser> {
  dynamic pickImageError;

  ImageUserProvider() : super(ImageStateUser(image: XFile('')));

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
          image: pickedFile,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      pickImageError = e;
    }
  }

  void removeImage() {
    state = ImageStateUser(image: XFile(''));
  }

  void reset() {
    state = ImageStateUser(image: XFile(''));
  }
}
