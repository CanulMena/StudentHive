import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/house_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {
    final step1 = ref.watch(allHousesPreviewProvider).isEmpty;
    if( step1) return true;
  return false;
});