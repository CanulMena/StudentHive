import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/request.dart';
import 'package:studenthive/presentation/provider/request/request_respository_provider.dart';

typedef RequestCallback = Future<void> Function(int idUser, int idPublication);
typedef RequestCallbackGetAllMyRequests = Future<List<MyRequest>> Function(int);
typedef RequestCallbackGetAllYourRequests = Future<List<YourRequest>> Function(int);
typedef RequestCallbackDelete = Future<void> Function(int);
typedef RequestCallbackEvaluateRequest = Future<void> Function(int, String);

final myRequestProvider = StateNotifierProvider<MyRequestNotifier, List<MyRequest>>((ref){ //! Son las solicitudes que les hicieron a mis publicaciones
  final requestRepository = ref.watch(requestRepositoryProvider);
  final getAllMyRequest = requestRepository.getMyRequestsByUserId;  
  final evaluateRequest = requestRepository.evaluateRequest;
  final refreshAllYourRequest = ref.watch(yourRequestProvider.notifier).getAllYourRequestsM;

  return MyRequestNotifier(
    getAllMyRequest: getAllMyRequest,
    deleteRequest: requestRepository.deleteRequest,
    evaluateRequest: evaluateRequest,
    refreshAllYourRequest: refreshAllYourRequest
    );
});

class MyRequestNotifier extends StateNotifier<List<MyRequest>> {
  final RequestCallbackGetAllMyRequests getAllMyRequest;
  final RequestCallbackDelete deleteRequest;
  final RequestCallbackEvaluateRequest evaluateRequest;
  final Future<void> Function(int) refreshAllYourRequest;

  MyRequestNotifier({ 
    required this.getAllMyRequest,
    required this.deleteRequest, 
    required this.evaluateRequest,
    required this.refreshAllYourRequest
    }) 
    : super([]);

  Future<void> refreshAllYourRequestM( int idUser ) async {
    await refreshAllYourRequest( idUser );
  }

  Future<void> evaluateRequestM( int idRequest, String statusRequest, int idUser ) async {
    try {
      await evaluateRequest(idRequest, statusRequest);
      await refreshAllYourRequestM(idUser);
      final newState = await getAllMyRequest(idUser); //* Estoy llamando a mi lista de solicitudes
      state =  newState;
    } catch (e) {
      throw Exception('Error al evaluar la solicitud');
    }
  }

  Future<void> getAllMyRequests( int idUser ) async {
    final requests = await getAllMyRequest( idUser );
    state = requests;
  }

  Future<void> deleteMyRequest(int idRequest) async {
    try{
      await deleteRequest(idRequest);
      var newState = List<MyRequest>.from(state);
      newState.removeWhere((element) => element.idRequest == idRequest);
      state = newState;
    } catch (e) {
      throw Exception('Error al eliminar la solicitud');
    }
  }
}
//!---------------------------------------------------------------------------------------------------------------------

final yourRequestProvider = StateNotifierProvider<YourRequestNotifier, List<YourRequest>>((ref){ //! Son las solicitudes que hice a otras publicaciones
  final requestRepository = ref.watch(requestRepositoryProvider);
  final removeRequest = requestRepository.deleteRequest;
  final getAllYourRequests = requestRepository.getYourRequestsById;  
  final postRequest = requestRepository.postRequest;
  return YourRequestNotifier(
    getAllYourRequests: getAllYourRequests,
    postRequest: postRequest,
    removeRequest: removeRequest
    );
});

class YourRequestNotifier extends StateNotifier<List<YourRequest>> {
  final RequestCallback postRequest;
  final RequestCallbackGetAllYourRequests getAllYourRequests;
  final RequestCallbackDelete removeRequest;

  YourRequestNotifier({ 
    required this.getAllYourRequests,
    required this.postRequest, 
    required this.removeRequest,
    }) 
    : super([]);

  Future<void> getAllYourRequestsM( int idUser ) async {
    final requests = await getAllYourRequests( idUser );
    state = requests;
  }

  Future<bool> myPostRequest(int idUser, int idPublication) async {
    try {
      await getAllYourRequests(idUser);
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
      var newState = List<YourRequest>.from(state);
      newState.removeWhere((element) => element.idRequest == idRequest);
      state = newState;
      
    } catch (e) {
      state = [];
    }
  }
}