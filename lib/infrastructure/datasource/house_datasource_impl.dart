import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:studenthive/config/constants/token/manage_token_app.dart';
import 'package:studenthive/domain/datasource/house_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/house_detail_mapper.dart';
import 'package:studenthive/infrastructure/mappers/house_preview_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_preview_studenthivedb.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/house_details.dart';

class HouseDataSourceImpl extends HouseDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.studenthive.somee.com/api/v1/RentalHouse",
    )
  );

  Map<String, dynamic> decodePayload(String token) { //* Puedo refactorizar esto a un archivo de utilidades
  try {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    return payloadMap;
  } catch (e) {
    return {};
  }
}

  @override //* Tenemos que agregar los datos
  Future<List<HousePreview>> getAllHouses({int pageSize = 3, int pagenNumber = 1}) async {

    final response = await dio.get("/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");

    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HousePreviewMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    return houses;
  }

  @override
  Future<List<HousePreview>> getAllActiveHouses({int pageSize = 3, int pagenNumber = 1}) async {

    final response = await dio.get("/true/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");

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

  await dio.post(
    '?IdUser=$idUser'
    '&Title=$title'
    '&Description=$description'
    '&WhoElse=$whoElse'
    '&RentPrice=$rentPrice'
    '&TypeHouse=$typeHouse'
    '&DetailRentalHouse.NumberOfGuests=$numberOfGuests'
    '&DetailRentalHouse.NumberOfBathrooms=$numberOfBathrooms'
    '&DetailRentalHouse.NumberOfRooms=$numberOfRooms'
    '&DetailRentalHouse.NumberOfHammocks=$numberOfHammocks'
    '&HouseService.Wifi=$wifi'
    '&HouseService.Kitchen=$kitchen'
    '&HouseService.Washer=$washer'
    '&HouseService.AirConditioning=$airConditioning'
    '&HouseService.Water=$water'
    '&HouseService.Gas=$gas'
    '&HouseService.Television=$television'
    '&HouseLocation.Address=$address'
    '&HouseLocation.City=$city'
    '&HouseLocation.State=$state'
    '&HouseLocation.Country=$country'
    '&HouseLocation.PostalCode=$postalCode'
    '&HouseLocation.Neighborhood=$neighborhood',
    data: formData);
}

  @override
  Future<List<HousePreview>> getAllActiveHousesByUser({int pageSize = 3, int pagenNumber = 1}) async {

    String? token = await Token.getToken();
    final payload = decodePayload(token!);
    final String emailPayload = payload['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];

    final response = await dio.get("/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");
    
    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HousePreviewMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    return houses.where((house) => house.emailUser == emailPayload && house.status == true ).toList();
    
  }

  @override
  Future<List<HousePreview>> getAllInactiveHousesByUser({int pageSize = 3, int pagenNumber = 1}) async {

    String? token = await Token.getToken();
    final payload = decodePayload(token!);
    final String emailPayload = payload['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];

    final response = await dio.get("/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");
    
    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HousePreviewMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    final List<HousePreview> housesInactive = houses.where((house) => house.emailUser == emailPayload && house.status == false ).toList();

    return housesInactive;

  }
  
  @override
  Future<List<HousePreview>> getAllHousesByUser({int pageSize = 3, int pagenNumber  = 1}) async {
    String? token = await Token.getToken();
    final payload = decodePayload(token!);
    final String emailPayload = payload['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];

    final response = await dio.get("/Publications?pageNumber=$pagenNumber&pageSize=$pageSize");
    
    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HousePreviewMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    final List<HousePreview> housesInactive = houses.where((house) => house.emailUser == emailPayload).toList();

    return housesInactive;
  }
}