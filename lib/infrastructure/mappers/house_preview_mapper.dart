import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_preview_studenthivedb.dart';

class HousePreviewMapper {

  static HousePreview housePreviewStudentHiveDbToEntity(HousePreviewStudentHiveDb house) {
    final Location location = Location(
      idLocation: house.houseLocation.idLocation,
      address: house.houseLocation.address,
      city: house.houseLocation.city,
      state: house.houseLocation.state,
      country: house.houseLocation.country,
      postalCode: house.houseLocation.postalCode,
      neighborhood: house.houseLocation.neighborhood,
    );
    return HousePreview(
        idPublication: house.idPublication,
        title: house.title,
        nameofUser: house.nameofUser,
        images: house.images,
        rentPrice: house.rentPrice,
        publicationDate: house.publicationDate,
        houseLocation: location
        );
  }

  static HousePreviewStudentHiveDb entityToHousePreviewStudentHiveDb(HousePreview house) {

    final location = HouseLocation(
      idLocation: house.houseLocation.idLocation,
      address: house.houseLocation.address,
      city: house.houseLocation.city,
      state: house.houseLocation.state,
      country: house.houseLocation.country,
      postalCode: house.houseLocation.postalCode,
      neighborhood: house.houseLocation.neighborhood,
    );

    return HousePreviewStudentHiveDb(
        idPublication: house.idPublication,
        title: house.title,
        nameofUser: house.nameofUser,
        images: house.images,
        rentPrice: house.rentPrice,
        publicationDate: house.publicationDate, 
        houseLocation: location
        );
  }

}
