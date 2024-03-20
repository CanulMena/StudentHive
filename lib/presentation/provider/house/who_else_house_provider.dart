import 'package:flutter_riverpod/flutter_riverpod.dart';

final whoElseProvider = StateNotifierProvider<WhoElseNotifier, String>((ref) {
  return WhoElseNotifier();
});

class WhoElseNotifier extends StateNotifier<String> { // this class is the notifier similar to setState.
  WhoElseNotifier() : super('');

  void changeWhoElse(String whoElse) {
    state = whoElse;
  }

  void resetWhoElse() {
    state = '';
  }
}