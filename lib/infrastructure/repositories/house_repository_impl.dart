import 'package:studenthive/domain/datasource/house_datasource.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/domain/repositories/house_repository.dart';

class HouseRepositoryImpl extends HouseRepository {
  final HouseDataSource houseDataSource;

  HouseRepositoryImpl({required this.houseDataSource});

  @override
  Future<List<HousePreview>> getAllHouses(
      {int pageSize = 3, int pagenNumber = 1}) {
    return houseDataSource.getAllHouses(
        pageSize: pageSize, pagenNumber: pagenNumber);
  }

  @override
  Future<House> getHouseById({int id = 1}) {
    return houseDataSource.getHouseById(id: id);
  }

  @override
  Future<void> postHouse({
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
    required List<String> imagePaths}){
    return houseDataSource.postHouse(
      idUser: idUser,
      title: title,
      description: description,
      // status: status,
      whoElse: whoElse,
      rentPrice: rentPrice,
      typeHouse: typeHouse,
      numberOfGuests: numberOfGuests,
      numberOfBathrooms: numberOfBathrooms,
      numberOfRooms: numberOfRooms,
      numberOfHammocks: numberOfHammocks,
      wifi: wifi,
      kitchen: kitchen,
      washer: washer,
      airConditioning: airConditioning,
      water: water,
      gas: gas,
      television: television,
      address: address,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      neighborhood: neighborhood,
      imagePaths: imagePaths
    );
  }
}
