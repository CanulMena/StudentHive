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
  Future<void> postHouse() {
    // TODO: implement postHouse
    throw UnimplementedError();
  }

}