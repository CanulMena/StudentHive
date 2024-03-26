import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/presentation/provider/house/house_repository_provider.dart';

final allHousesPreviewProvider = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){ //Todas las casas de la base de datos
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllHouses;
  return HousesNotifier(fetchMoreHousesPreview: fetchMoreHousesPreview);
});

final allActiveHousesPreviewProvider = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){ //Todas las casas activas de la base de datos
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllActiveHouses;
  return HousesNotifier(fetchMoreHousesPreview: fetchMoreHousesPreview);
});

final allActiveHousesPreviewProviderByUser = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){ //Casas activas del usuario
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllActiveHousesByUser;
  return HousesNotifier(fetchMoreHousesPreview: fetchMoreHousesPreview);
});

final allInactiveHousesPreviewProviderByUser = StateNotifierProvider<HousesNotifier, List<HousePreview>>((ref){ //Casas inactivas del usuario
  final fetchMoreHousesPreview = ref.watch( housesRepositoryProvider ).getAllInactiveHousesByUser;
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
    isLoading = true;
    currentPage++;
    final List<HousePreview> houses = await fetchMoreHousesPreview(pageSize: 15, pagenNumber: currentPage);
    state = [ ...state, ...houses];
    await Future.delayed( const Duration(milliseconds: 300) );
    isLoading = false;
  }

  Future<void> refreshData() async {
    if( isLoading ) return;

    isLoading = true;
    currentPage = 1; // Restablece la página a la inicial
    final List<HousePreview> houses = await fetchMoreHousesPreview(pageSize: 15, pagenNumber: currentPage);
    state = houses; // Reemplaza las publicaciones existentes con las nuevas
    await Future.delayed( const Duration(milliseconds: 300) );
    isLoading = false;
  }
}