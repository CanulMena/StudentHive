import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationHouseState {
  final String postalCode;
  final String country;
  final String city;
  final String state;
  final String address;
  final String neighborhood;

  LocationHouseState({
    required this.postalCode,
    required this.country,
    required this.city,
    required this.state,
    required this.address,
    required this.neighborhood,
  });

  
}

final locationHouseProvider = StateNotifierProvider<LocationHouseNotifier, LocationHouseState>((ref) {
  return LocationHouseNotifier();
});

class LocationHouseNotifier extends StateNotifier<LocationHouseState> {
  LocationHouseNotifier()
      : super(
        LocationHouseState(
          postalCode: '',
          country: '',
          city: '',
          state: '',
          address: '',
          neighborhood: '',
        ));

  void setPostalCode(
      String postalCode,
      String country,
      String city,
      String newState,
      String address,
      String neighborhood) {
    state = LocationHouseState(
      postalCode: postalCode,
      country: country,
      city: city,
      state: newState,
      address: address,
      neighborhood: neighborhood,
    );
  }

  void reset() {
    state = LocationHouseState(
      postalCode: '',
      country: '',
      city: '',
      state: '',
      address: '',
      neighborhood: '',
    );
  }
}
