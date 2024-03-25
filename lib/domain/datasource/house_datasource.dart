import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';

abstract class HouseDataSource {

  Future<List<HousePreview>> getAllHouses({ int pageSize, int pagenNumber });

  Future<List<HousePreview>> getAllActiveHouses({ int pageSize, int pagenNumber });

  Future<House> getHouseById({int id});

  Future<void> postHouse ({
    required int idUser,
    required String title,
    required String description,
    // bool status = false,
    required String whoElse,
    required int rentPrice,
    required String typeHouse,
    required int numberOfGuests,
    required int numberOfBathrooms,
    required int numberOfRooms,
    required int numberOfHammocks,
    required bool wifi,
    required bool kitchen,
    required bool washer,
    required bool airConditioning,
    required bool water,
    required bool gas,
    required bool television,
    required String address,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required String neighborhood,
    required List<String> imagePaths,
  });

}