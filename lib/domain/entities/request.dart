class Request {
  final int idRequest;
  final int idUser;
  final int idPublication;
  final String? title;
  final int? rentPrice;
  final String? userName;
  final String? status;
  final String? createdAt;
  final String? image;

  Request({
    required this.idRequest,
    required this.idUser,
    required this.idPublication,
    required this.status,
    required this.createdAt,
    required this.title,
    required this.rentPrice,
    required this.userName,
    required this.image,
  });

}
