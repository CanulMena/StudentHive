import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_Preview_studenthivedb.dart';

class HousePreviewMapper {
  //Todo: Tendremos que mapear el response que mostraremos al igual que los detalles.
  static HousePreview housePreviewStudentHiveDbToEntity(HousePreviewStudentHiveDb house) {
    return HousePreview(
        idPublication: house.idPublication,
        title: house.title,
        nameofUser: house.nameofUser,
        images: house.images,
        rentPrice: house.rentPrice,
        publicationDate: house.publicationDate);
  }

}
