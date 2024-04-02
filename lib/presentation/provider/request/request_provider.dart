// import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/request.dart';
// import 'package:studenthive/infrastructure/repositories/request_repository_impl.dart';
import 'package:studenthive/presentation/provider/request/request_respository_provider.dart';


final requestProvider = StateNotifierProvider<RequestNotifier, List<Request>?>((ref){
  final requestRepository = ref.watch(requestRepositoryProvider);
  final postRequest = requestRepository.postRequest;
  return RequestNotifier(postRequest);
});

// final createRequestProvider =
//     Provider((ref) => ref.watch(requestRepositoryProvider).postRequest);
typedef RequestCallback = Future<void> Function(int idUser, int idPublication);

class RequestNotifier extends StateNotifier<List<Request>?> {
  final RequestCallback postRequest;

  RequestNotifier(this.postRequest) : super(null);

  Future<void> requestPost(int idUser, int idPublication) async {
    await postRequest(idUser, idPublication);
    //TODO implementar el get all requests
    // final requests = await postRequest.getAllRequests();
    // state = requests;
  }

  // Future<void> getAllRequests() async {
  //   final requests = await _requestRepository.getAllRequests();
  //   state = requests;
  // }

  // Future<void> getRequestById(int id) async {
  //   final request = await _requestRepository.getRequestById(id);
  //   state = [request];
  // }

  // Future<void> deleteRequest(int id) async {
  //   await _requestRepository.deleteRequest(id);
  //   final requests = await _requestRepository.getAllRequests();
  //   state = requests;
  // }

  // Future<void> updateRequest(int id, Request request) async {
  //   await _requestRepository.updateRequest(id, request);
  //   final requests = await _requestRepository.getAllRequests();
  //   state = requests;
  // }
}