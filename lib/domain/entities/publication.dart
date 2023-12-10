
class Publication {
  int idPublicacion;
  String titulo;
  String imagenes;
  int numeroDeCuartosHabitacion;
  String ubicacionHabitacion;
  double precioHabitacion;
  String fechaPublicacion;
  String estatus;
  int idAnfitrion;
  String nombreAnfitrion;
  String numeroTelefono;
  String genero;

  Publication({
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
}

