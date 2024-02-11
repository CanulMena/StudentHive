
class PublicationModel {
  int idPublicacion;
  String titulo;
  List<String> imagenes;
  int numeroDeCuartosHabitacion;
  String ubicacionHabitacion;
  double precioHabitacion;
  String fechaPublicacion;
  String estatus;
  int idAnfitrion;
  String nombreAnfitrion;
  String numeroTelefono;
  String genero;

  PublicationModel({
    required this.idPublicacion,
    required this.titulo,
    required this.imagenes,
    required this.numeroDeCuartosHabitacion,
    required this.ubicacionHabitacion,
    required this.precioHabitacion,
    required this.fechaPublicacion,
    required this.estatus,
    required this.idAnfitrion,
    required this.nombreAnfitrion,
    required this.numeroTelefono,
    required this.genero,
  });
  //*Estamos creando una constructor con nombre que se llama fromJson y retornará el contructor de la clase. Y pedirá como parametros un json.
  factory PublicationModel.fromJson( Map<String, dynamic> json ){
    return PublicationModel(
      idPublicacion: json['idPublicacion'], 
      titulo: json['titulo'], 
      imagenes: json['imagenes'], 
      numeroDeCuartosHabitacion: json['numeroDeCuartosHabitacion'], 
      ubicacionHabitacion: json['ubicacionHabitacion'], 
      precioHabitacion: json['precioHabitacion'], 
      fechaPublicacion: json['fechaPublicacion'], 
      estatus: json['estatus'], 
      idAnfitrion: json['idAnfitrion'], 
      nombreAnfitrion: json['nombreAnfitrion'], 
      numeroTelefono: json['numeroTelefono'], 
      genero: json['genero'],
      );
  }
}