import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_details.dart';

class HouseMapper {
  
  static House houseDetailtoEntity(HouseDetails house) {

    final houseService = HouseService(
      idHouseService: house.idHouseServiceNavigation.idHouseService,
      wifi: house.idHouseServiceNavigation.wifi,
      kitchen: house.idHouseServiceNavigation.kitchen,
      washer: house.idHouseServiceNavigation.washer,
      airConditioning: house.idHouseServiceNavigation.airConditioning,
      water: house.idHouseServiceNavigation.water,
      gas: house.idHouseServiceNavigation.gas,
      television: house.idHouseServiceNavigation.television,
    );

    final location = Location(
      idLocation: house.idLocationNavigation.idLocation,
      address: house.idLocationNavigation.address,
      city: house.idLocationNavigation.city,
      state: house.idLocationNavigation.state,
      country: house.idLocationNavigation.country,
      postalCode: house.idLocationNavigation.postalCode,
      neighborhood: house.idLocationNavigation.neighborhood,
    );

    final rentalHouseDetail = RentalHouseDetail(
      idRentalHouseDetail: house.idRentalHouseDetailNavigation.idRentalHouseDetail,
      numberOfGuests: house.idRentalHouseDetailNavigation.numberOfGuests,
      numberOfBathrooms: house.idRentalHouseDetailNavigation.numberOfBathrooms,
      numberOfRooms: house.idRentalHouseDetailNavigation.numberOfRooms,
      numbersOfBed: house.idRentalHouseDetailNavigation.numberOfHammocks,
      numberOfHammocks: house.idRentalHouseDetailNavigation.numberOfHammocks,
    );


    return House(
        idPublication: house.idPublication,
        title: house.title,
        description: house.description,
        whoElse: house.whoElse,
        rentPrice: house.rentPrice,
        typeHouse: house.typeHouse,
        idUser: house.idUser,
        publicationDate: house.publicationDate,
        houseService: houseService,
        location: location,
        rentalHouseDetail: rentalHouseDetail,
        images: house.images);
  }

}
