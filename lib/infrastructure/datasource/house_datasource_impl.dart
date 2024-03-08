import 'package:dio/dio.dart';
import 'package:studenthive/domain/datasource/house_datasource.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/infrastructure/mappers/rentalhouse_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/housePreview_studenthivedb.dart';

class HouseDataSourceImpl extends HouseDataSource{

  final Dio dio = Dio();

  @override //* Tenemos que agregar los datos
  Future<List<HousePreview>> getAllHouses({int pageSize = 1, int pagenNumber = 1}) async {

    final response = await dio.get("https://studenthivepro.somee.com/api/v1/RentalHouse/Publications?pageNumber=1&pageSize=10");
    
    final studenthiveDbResponse = StudentHiveDbResponse.fromJson(response.data);

    final List<HousePreview> houses = studenthiveDbResponse.results.map((e) => HouseMapper.housePreviewStudentHiveDbToEntity(e)).toList();

    return houses;
  }

  @override
  Future<House> getHouseById(int id) {
    // TODO: implement getHouseById
    throw UnimplementedError();
  }

  @override
  Future<void> postHouse() {
    // TODO: implement postHouse
    throw UnimplementedError();
  }

}