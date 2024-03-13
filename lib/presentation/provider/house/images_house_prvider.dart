import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagesHouseProvider = StateNotifierProvider<ImagesHouseProvider, List<XFile>>((ref) {
  return ImagesHouseProvider();
});

class ImagesHouseProvider extends StateNotifier<List<XFile>> {
  ImagesHouseProvider() : super([]);

  void addImage(XFile image) {
    state = [...state, image];
  }

  void removeImage(XFile image) {
    state = state.where((element) => element.path != image.path).toList();
  }
}
