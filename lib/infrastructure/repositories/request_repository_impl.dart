import 'package:studenthive/domain/datasource/request_datasource.dart';
import 'package:studenthive/domain/entities/request.dart';
import 'package:studenthive/domain/repositories/request_repository.dart';

class RequestRepositoryImpl extends RequestRepository {
  final RequestDataSource requestDataSource;

  RequestRepositoryImpl({required this.requestDataSource});

  @override
  Future<void> postRequest(int idUser, int idPublication) {
    return requestDataSource.postRequest(idUser, idPublication);
  }
  
  @override
  Future<List<MyRequest>> getMyRequestsByUserId(int idUser) {
    return requestDataSource.getRequestsByUserId(idUser);
  }
  
  @override
  Future<void> deleteRequest(int idRequest) {
    return requestDataSource.deleteRequest(idRequest);
  }
  
  @override
  Future<List<YourRequest>> getYourRequestsById(int idUser) {
    return requestDataSource.getYourRequestsById(idUser);
  }

}