import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/house/house_repository_provider.dart';

final houseDetailsProvider = StateNotifierProvider<MovieMapNotifier, Map<String, House>>((ref) {
  final housesRepository = ref.watch(housesRepositoryProvider).getHouseById;
  return MovieMapNotifier(
    getHouse: housesRepository
  );
});

/*
  {
    '5023' : House() - instancia de house;
    '5024' : House() - instancia de house;
    '5025' : House() - instancia de house;
  }
 */

typedef GetMovieCallBack = Future<House> Function({int id});



class MovieMapNotifier extends StateNotifier<Map<String, House>> {

  final GetMovieCallBack getHouse;

  MovieMapNotifier({required this.getHouse}) : super( {} );

  Future<void> loadHouseDetail( String idHouse ) async {

    if(state[idHouse] != null) return; //* Si ya existe no tenemos que volver a agregarlo al mapa

    print('realizando peticion http');
    final movie = await getHouse(id: int.parse(idHouse));

    state = {...state, idHouse: movie};
  }
}