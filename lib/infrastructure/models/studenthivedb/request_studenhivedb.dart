class RequestModel {
  final int idRequest;
  final int idUser;
  final int idPublication;
  final String status;
  final String createdAt;

  RequestModel({
    required this.idRequest,
    required this.idUser,
    required this.idPublication,
    required this.status,
    required this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
      idRequest: json["idRequest"],
      idUser: json["idUser"],
      idPublication: json["idPublication"],
      status: json["status"],
      createdAt: json["createdAt"],
    );

  Map<String, dynamic> toJson() => {
    "idRequest": idRequest,
    "idUser": idUser,
    "idPublication": idPublication,
    "status": status,
    "createdAt": createdAt,
  };

}
