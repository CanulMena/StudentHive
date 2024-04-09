import 'package:studenthive/domain/entities/entities.dart';

abstract class RequestRepository {
  Future<void> postRequest( int idUser, int idPublication );

  Future<List<MyRequest>> getMyRequestsByUserId( int idUser );

  Future<void> deleteRequest( int idRequest );

  Future<List<YourRequest>> getYourRequestsById( int idUser );

  Future<void> evaluateRequest( int idRequest, String status);
}