import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/presentation/provider/house/house_repository_provider.dart';

final allHousesPreviewProvider = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllHouses;
  return HousesNotifier(fetchMoreHousesPreview: fetchMoreHousesPreview);
});



typedef HousePreviewCallBack = Future<List<HousePreview>> Function({int pageSize, int pagenNumber});


class HousesNotifier extends StateNotifier<List<HousePreview>>{

  final HousePreviewCallBack fetchMoreHousesPreview;
  bool isLoading = false;
  int currentPage = 0;

  HousesNotifier({required this.fetchMoreHousesPreview}) : super( [] );

  
  Future<void> loadNextPage() async {
    if( isLoading ) return;

    // print('haciendo fetch');
    isLoading = true;
    currentPage++;
    final List<HousePreview> houses = await fetchMoreHousesPreview(pageSize: 3, pagenNumber: currentPage);
    state = [ ...state, ...houses];
    await Future.delayed( const Duration(milliseconds: 300) );
    isLoading = false;
  }

  
}