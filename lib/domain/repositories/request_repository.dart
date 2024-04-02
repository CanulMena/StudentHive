abstract class RequestRepository {
  Future<void> postRequest(
    int idUser,
    int idPublication,
  );
}