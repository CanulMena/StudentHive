import 'package:flutter_riverpod/flutter_riverpod.dart';

final descriptionHouseProvider = StateNotifierProvider<DescriptionHouseNotifier, String>((ref) {
  return DescriptionHouseNotifier();
});

class DescriptionHouseNotifier extends StateNotifier<String> {
  DescriptionHouseNotifier() : super('');

  void setDescription(String description) {
    state = description;
  }

  void reset() {
    state = '';
  }

}