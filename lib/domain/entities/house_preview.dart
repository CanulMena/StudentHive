import 'package:studenthive/domain/entities/entities.dart';

class HousePreview {
  final int idPublication;
  final String title;
  final String nameofUser;
  final List<String> images;
  final int rentPrice;
  final DateTime publicationDate;
  final Location houseLocation;

  HousePreview({
    required this.idPublication,
    required this.title,
    required this.nameofUser,
    required this.images,
    required this.rentPrice,
    required this.publicationDate,
    required this.houseLocation
    });
}
