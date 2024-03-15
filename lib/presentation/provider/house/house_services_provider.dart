import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseServicesState {
  final bool isWifiAvailable;
  final bool isKitchenAvailable;
  final bool isWasherAvailable;
  final bool isTvAvailable;
  final bool isAirConditionerAvailable;
  final bool isWaterAvailable;
  final bool isGasAvailable;

  HouseServicesState({
    required this.isWifiAvailable,
    required this.isKitchenAvailable,
    required this.isWasherAvailable,
    required this.isTvAvailable,
    required this.isAirConditionerAvailable,
    required this.isWaterAvailable,
    required this.isGasAvailable,
  });

  HouseServicesState copyWith({
    bool? isWifiAvailable,
    bool? isKitchenAvailable,
    bool? isWasherAvailable,
    bool? isTvAvailable,
    bool? isAirConditionerAvailable,
    bool? isWaterAvailable,
    bool? isGasAvailable,
  }) {
    return HouseServicesState(
      isWifiAvailable: isWifiAvailable ?? this.isWifiAvailable,
      isKitchenAvailable: isKitchenAvailable ?? this.isKitchenAvailable,
      isWasherAvailable: isWasherAvailable ?? this.isWasherAvailable,
      isTvAvailable: isTvAvailable ?? this.isTvAvailable,
      isAirConditionerAvailable: isAirConditionerAvailable ?? this.isAirConditionerAvailable,
      isWaterAvailable: isWaterAvailable ?? this.isWaterAvailable,
      isGasAvailable: isGasAvailable ?? this.isGasAvailable,
    );
  }

}


final houseServicesProvider = StateNotifierProvider< HouseServicesNotifier, HouseServicesState>((ref) {
  return HouseServicesNotifier();
});

class HouseServicesNotifier extends StateNotifier<HouseServicesState>{
  HouseServicesNotifier() : super( 
    HouseServicesState(
    isWifiAvailable: false,
    isKitchenAvailable: false,
    isWasherAvailable: false,
    isTvAvailable: false,
    isAirConditionerAvailable: false,
    isWaterAvailable: false,
    isGasAvailable: false,
    ));

    void setWifiAvailable(bool isWifiAvailable){
      state = state.copyWith(isWifiAvailable: isWifiAvailable);
    }

    void setKitchenAvailable(bool isKitchenAvailable){
      state = state.copyWith(isKitchenAvailable: isKitchenAvailable);
    }

    void setWasherAvailable(bool isWasherAvailable){
      state = state.copyWith(isWasherAvailable: isWasherAvailable);
    }

    void setTvAvailable(bool isTvAvailable){
      state = state.copyWith(isTvAvailable: isTvAvailable);
    }

    void setAirConditionerAvailable(bool isAirConditionerAvailable){
      state = state.copyWith(isAirConditionerAvailable: isAirConditionerAvailable);
    }

    void setWaterAvailable(bool isWaterAvailable){
      state = state.copyWith(isWaterAvailable: isWaterAvailable);
    }

    void setGasAvailable(bool isGasAvailable){
      state = state.copyWith(isGasAvailable: isGasAvailable);
    }

    void reset(){
      state = HouseServicesState(
        isWifiAvailable: false,
        isKitchenAvailable: false,
        isWasherAvailable: false,
        isTvAvailable: false,
        isAirConditionerAvailable: false,
        isWaterAvailable: false,
        isGasAvailable: false,
      );
    }

}