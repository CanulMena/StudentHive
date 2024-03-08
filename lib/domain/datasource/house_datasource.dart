import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';

abstract class HouseDataSource {

  Future<List<HousePreview>> getAllHouses({ int pageSize, int pagenNumber });

  Future<House> getHouseById( int id );

  Future<void> postHouse (  );

}