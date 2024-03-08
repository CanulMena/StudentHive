import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/presentation/provider/house/house_repository_provider.dart';

final allHousesPreviewProvider = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllHousesPreview;
  return HousesNotifier(fetchMoreHousesPreview: fetchMoreHousesPreview);
});


typedef HousePreviewCallBack = Future<List<HousePreview>> Function({int pageSize, int pagenNumber});


class HousesNotifier extends StateNotifier<List<HousePreview>>{

  final HousePreviewCallBack fetchMoreHousesPreview;
  int currentPage = 1;

  HousesNotifier({required this.fetchMoreHousesPreview}) : super( [] );

  
  Future<void> loadNextPage() async {
    currentPage++;
    final List<HousePreview> houses = await fetchMoreHousesPreview(pageSize: 10, pagenNumber: currentPage);
    state = [ ...state, ...houses];
  }

  
}