import 'package:flutter_riverpod/flutter_riverpod.dart';

final descriptionHouseProvider = StateNotifierProvider<TitleHouseNotifier, String>((ref) {
  return TitleHouseNotifier();
});

class TitleHouseNotifier extends StateNotifier<String> {
  TitleHouseNotifier() : super('');

  void setDescription(String description) {
    state = description;
  }

  void reset() {
    state = '';
  }

}