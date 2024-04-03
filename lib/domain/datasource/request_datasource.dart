import 'package:studenthive/domain/entities/request.dart';

abstract class RequestDataSource {

  Future<void> postRequest(
    int idUser,
    int idPublication,
  );

  // Future<List<Request>> getRequestsByUserId({ required int idUser });
}
