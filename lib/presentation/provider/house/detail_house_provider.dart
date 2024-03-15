import 'package:flutter_riverpod/flutter_riverpod.dart';

  class DetailHouseState {
    int numberOfVisitors = 0;
    int numberOfBeds = 0;
    int numberOfHammocks = 0;
    int numberOfBathrooms = 0;
  }

final detailHouseProvider = StateNotifierProvider<DetailHouseNotifier, DetailHouseState>((ref) {
  return DetailHouseNotifier();
});

class DetailHouseNotifier extends StateNotifier<DetailHouseState>{
  DetailHouseNotifier() : super(DetailHouseState());

  
}