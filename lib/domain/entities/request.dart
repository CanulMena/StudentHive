///? Definir mis solicitudes  
///* Foto de principal de la publicación
///* Titulo de la publicación
///* Precio de la publicación
///* Nombre del usuario que publico 
///* Fecha de la cual hice la solicitud

class MyRequest {
  final int? idRequest;
  final int idPublication; // --> Necesario para hacer un getbyid de la publicacion
  final String? title;  
  final int? rentPrice;
  final String? userName;
  final String? userLastName;
  final String? status;
  final String? image;

  MyRequest({
    required this.idRequest,
    required this.idPublication,
    required this.userLastName,
    required this.status,
    required this.title,
    required this.rentPrice,
    required this.userName,
    required this.image,
  });

}
