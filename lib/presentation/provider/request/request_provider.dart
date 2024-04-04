import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/request.dart';
import 'package:studenthive/presentation/provider/request/request_respository_provider.dart';


final requestProvider = StateNotifierProvider<RequestNotifier, List<MyRequest>>((ref){
  final requestRepository = ref.watch(requestRepositoryProvider);
  final removeRequest = requestRepository.deleteRequest;
  final getAllMyRequests = requestRepository.getRequestsByUserId;
  final postRequest = requestRepository.postRequest;
  return RequestNotifier(
    getAllMyPublications: getAllMyRequests, 
    postRequest: postRequest,
    removeRequest: removeRequest
    );
});


typedef RequestCallback = Future<void> Function(int idUser, int idPublication);
typedef RequestCallbackGetAllMyPublications = Future<List<MyRequest>> Function(int);
typedef RequestCallbackDelete = Future<void> Function(int);

class RequestNotifier extends StateNotifier<List<MyRequest>> {
  final RequestCallback postRequest;
  final RequestCallbackGetAllMyPublications getAllMyPublications;
  final RequestCallbackDelete removeRequest;

  RequestNotifier({ 
    required this.getAllMyPublications, 
    required this.postRequest, 
    required this.removeRequest}) 
    : super([]);

  Future<void> getAllMyRequests( int idUser ) async {
    final requests = await getAllMyPublications( idUser );
    state = requests;
  }

  Future<bool> myPostRequest(int idUser, int idPublication) async {
    try {
      await getAllMyRequests(idUser);
      final hasExistingRequest = state.any((element) => element.idPublication == idPublication);
      if (!hasExistingRequest) {
        await postRequest(idUser, idPublication);
        return true; // Devuelve true si la petición POST es exitosa
      }
    } catch (e) {
      // Manejar la excepción aquí
    }
    return false; // Devuelve false si la petición POST falla o si ya existe una solicitud
  }

  Future<void> deleteRequest(int idRequest) async {
    try{
      await removeRequest(idRequest);
      var newState = state;
      newState.removeWhere((element) => element.idRequest == idRequest);
      state = newState;
    } catch (e) {
      // Manejar la excepción aquí
    }
  }
}