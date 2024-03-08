import 'package:studenthive/domain/datasource/house_datasource.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';
import 'package:studenthive/domain/repositories/house_repository.dart';

class HouseRepositoryImpl extends HouseRepository{

  final HouseDataSource houseDataSource;

  HouseRepositoryImpl({required this.houseDataSource});

  @override
  Future<List<HousePreview>> getAllHousesPreview({int pageSize = 1, int pagenNumber = 1}) {
    return houseDataSource.getAllHouses(pageSize: pageSize, pagenNumber: pagenNumber);
  }
  
  @override
  Future<House> getHouseById({int id = 1}) {
    return houseDataSource.getHouseById(id: id);
  }
  
  @override
  Future<void> postHouse() {
    // TODO: implement postHouse
    throw UnimplementedError();
  }

}