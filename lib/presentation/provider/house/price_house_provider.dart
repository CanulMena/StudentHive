import 'package:flutter_riverpod/flutter_riverpod.dart';

final priceHouseProvider = StateNotifierProvider<PriceHouseNotifier, String>((ref) {
  return PriceHouseNotifier();
});

class PriceHouseNotifier extends StateNotifier<String> {
  PriceHouseNotifier() : super('');

  void setPrice(String price) {
    state = price;
  }

  void reset() {
    state = '';
  }
}