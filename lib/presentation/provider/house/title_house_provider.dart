import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleHouseProvider = StateNotifierProvider<TitleHouseNotifier, String>((ref) {
  return TitleHouseNotifier();
});

class TitleHouseNotifier extends StateNotifier<String> {
  TitleHouseNotifier() : super('');

  void setTitle(String title) {
    state = title;
  }

  void reset() {
    state = '';
  }

}