import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/domain/entities/house_preview.dart';

abstract class HouseRepository {

  Future<List<HousePreview>> getAllHousesPreview({int pageSize, int pagenNumber});

  Future<House> getHouseById({int id});

  Future<void> postHouse (  );

}