import 'package:flutter_riverpod/flutter_riverpod.dart';

final whoElseProvider = StateNotifierProvider<WhoElseNotifier, String>((ref) {
  return WhoElseNotifier();
});

class WhoElseNotifier extends StateNotifier<String> {
  WhoElseNotifier() : super('');

  void changeWhoElse(String whoElse) {
    state = whoElse;
  }
}