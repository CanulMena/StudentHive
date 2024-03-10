import 'package:dio/dio.dart';
import 'package:studenthive/domain/datasource/house_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/house_detail_mapper.dart';
import 'package:studenthive/infrastructure/mappers/house_preview_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_Preview_studenthivedb.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_details.dart';

class HouseDataSourceImpl extends HouseDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://studenthivepro.somee.com/api/v1/RentalHouse",
    )
  );

  @override //* Tenemos que agregar los datos
  Future<List<HousePreview>> getAllHouses({int pageSize = 10, int pagenNumber = 1}) async {

    final response = await dio.get("/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");
    
    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HousePreviewMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    return houses;
  }

  @override
  Future<House> getHouseById({int id = 1}) async {
    final response = await dio.get('/$id');
    
    final houseDetails = HouseDetails.fromJson(response.data);

    final House house  = HouseMapper.houseDetailtoEntity(houseDetails);

    return house;
  }

  @override
  Future<void> postHouse({
    required int idUser,
    required String title,
    required String description,
    bool status = false,
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
    }) async {

    List<MultipartFile> imageFiles = [];
    for (var path in imagePaths) {
      MultipartFile file = await MultipartFile.fromFile(path);
      imageFiles.add(file);
    }

    final formData = FormData.fromMap({
      "IdUser": idUser,
      "Title": title,
      "Description": description,
      "Status": status,
      "WhoElse": whoElse,
      "RentPrice": rentPrice,
      "TypeHouse": typeHouse,
      "DetailRentalHouse.NumberOfGuests": numberOfGuests,
      "DetailRentalHouse.NumberOfBathrooms": numberOfBathrooms,
      "DetailRentalHouse.NumberOfRooms": numberOfRooms,
      "DetailRentalHouse.NumberOfHammocks": numberOfHammocks,
      "HouseService.Wifi": wifi,
      "HouseService.Kitchen": kitchen,
      "HouseService.Washer": washer,
      "HouseService.AirConditioning": airConditioning,
      "HouseService.Water": water,
      "HouseService.Gas": gas,
      "HouseService.Television": television,
      "HouseLocation.Address": address,
      "HouseLocation.City": city,
      "HouseLocation.State": state,
      "HouseLocation.Country": country,
      "HouseLocation.PostalCode": postalCode,
      "HouseLocation.Neighborhood": neighborhood,
      "ImagesFiles": imageFiles,
  });

  await dio.post('', data: formData);
}

}