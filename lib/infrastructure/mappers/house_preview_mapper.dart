import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_preview_studenthivedb.dart';

class HousePreviewMapper {

  static HousePreview housePreviewStudentHiveDbToEntity(HousePreviewStudentHiveDb house) {
    return HousePreview(
        idPublication: house.idPublication,
        title: house.title,
        nameofUser: house.nameofUser,
        images: house.images,
        rentPrice: house.rentPrice,
        publicationDate: house.publicationDate);
  }

  static HousePreviewStudentHiveDb entityToHousePreviewStudentHiveDb(HousePreview house) {
    return HousePreviewStudentHiveDb(
        idPublication: house.idPublication,
        title: house.title,
        nameofUser: house.nameofUser,
        images: house.images,
        rentPrice: house.rentPrice,
        publicationDate: house.publicationDate);
  }

}
