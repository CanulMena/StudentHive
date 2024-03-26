import 'package:studenthive/domain/entities/entities.dart';

class HousePreview {
  final int idPublication;
  final bool status;
  final String title;
  final String nameofUser;
  final String emailUser;
  final List<String> images;
  final int rentPrice;
  final DateTime publicationDate;
  final Location houseLocation;

  HousePreview({
    required this.idPublication,
    required this.status,
    required this.title,
    required this.nameofUser,
    required this.emailUser,
    required this.images,
    required this.rentPrice,
    required this.publicationDate,
    required this.houseLocation
    });
}
