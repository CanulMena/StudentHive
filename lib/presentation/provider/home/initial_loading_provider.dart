import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(allHousesPreviewProvider).isEmpty;
  final step2 = ref.watch(userProvider);
  if (step1 || step2 == null) {
    return true;
  }
  return false;
});