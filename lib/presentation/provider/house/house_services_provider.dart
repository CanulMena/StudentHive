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

    void setPostalCode({
      required bool isWifiAvailable,
      required bool isKitchenAvailable,
      required bool isWasherAvailable,
      required bool isTvAvailable,
      required bool isAirConditionerAvailable,
      required bool isWaterAvailable,
      required bool isGasAvailable}){
        state = HouseServicesState(
          isWifiAvailable: isWifiAvailable,
          isKitchenAvailable: isKitchenAvailable,
          isWasherAvailable: isWasherAvailable,
          isTvAvailable: isTvAvailable,
          isAirConditionerAvailable: isAirConditionerAvailable,
          isWaterAvailable: isWaterAvailable,
          isGasAvailable: isGasAvailable,
        );
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