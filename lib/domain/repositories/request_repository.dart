import 'package:studenthive/domain/entities/request.dart';

abstract class RequestRepository {
  Future<void> postRequest(
    int idUser,
    int idPublication,
  );

  // Future<List<Request>> getRequestsByUserId({ required int idUser });
}