import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailHouseState {
  final int numberOfVisitors;
  final int numberOfBeds;
  final int numberOfHammocks;
  final int numberOfBathrooms;

  DetailHouseState({
    required this.numberOfVisitors,
    required this.numberOfBeds,
    required this.numberOfHammocks,
    required this.numberOfBathrooms,
  });

  DetailHouseState copyWith({
    int? numberOfVisitors,
    int? numberOfBeds,
    int? numberOfHammocks,
    int? numberOfBathrooms,
  }) {
    return DetailHouseState(
      numberOfVisitors: numberOfVisitors ?? this.numberOfVisitors,
      numberOfBeds: numberOfBeds ?? this.numberOfBeds,
      numberOfHammocks: numberOfHammocks ?? this.numberOfHammocks,
      numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
    );
  }
}

final detailHouseProvider = StateNotifierProvider<DetailHouseNotifier, DetailHouseState>((ref) {
  return DetailHouseNotifier();
});

class DetailHouseNotifier extends StateNotifier<DetailHouseState> {
  DetailHouseNotifier()
      : super(DetailHouseState(
          numberOfVisitors: 0,
          numberOfBeds: 0,
          numberOfHammocks: 0,
          numberOfBathrooms: 0,
        ));

  void incrementVisitors() {
    state = state.copyWith(numberOfVisitors: state.numberOfVisitors + 1);
  }

  void decrementVisitors() {
    if (state.numberOfVisitors > 0) {
    state = state.copyWith(numberOfVisitors: state.numberOfVisitors - 1);
    }
  }

  void incrementBeds() {
    state = state.copyWith(numberOfBeds: state.numberOfBeds + 1);
  }

  void decrementBeds() {
    if (state.numberOfBeds > 0) {
    state = state.copyWith(numberOfBeds: state.numberOfBeds - 1);
    }
  }

  void incrementHammocks() {
    state = state.copyWith(numberOfHammocks: state.numberOfHammocks + 1);
  }

  void decrementHammocks() {
    if (state.numberOfHammocks > 0) {
    state = state.copyWith(numberOfHammocks: state.numberOfHammocks - 1);
    }
  }

  void incrementBathrooms() {
    state = state.copyWith(numberOfBathrooms: state.numberOfBathrooms + 1);
  }

  void decrementBathrooms() {
    if( state.numberOfBathrooms > 0) {
    state = state.copyWith(numberOfBathrooms: state.numberOfBathrooms - 1);
    }
  }

  void reset() {
    state = DetailHouseState(
        numberOfVisitors: 0,
        numberOfBeds: 0,
        numberOfHammocks: 0,
        numberOfBathrooms: 0
        );
  }
}
