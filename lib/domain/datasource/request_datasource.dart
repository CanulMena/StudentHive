import 'package:studenthive/domain/entities/entities.dart';

abstract class RequestDataSource {
  Future<void> postRequest( int idUser, int idPublication );

  Future<List<MyRequest>> getRequestsByUserId( int idUser );

  Future<void> deleteRequest( int idRequest );

  Future<List<YourRequest>> getYourRequestsById( int idUser );
}
