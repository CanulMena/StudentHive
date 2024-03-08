import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/infrastructure/datasource/house_datasource_impl.dart';
import 'package:studenthive/infrastructure/repositories/house_repository_impl.dart';

final housesRepositoryProvider = Provider<HouseRepositoryImpl>((ref) =>  HouseRepositoryImpl(houseDataSource: HouseDataSourceImpl()));