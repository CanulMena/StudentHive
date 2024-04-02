import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/infrastructure/datasource/request_datasource_impl.dart';
import 'package:studenthive/infrastructure/repositories/request_repository_impl.dart';

final requestRepositoryProvider = Provider<RequestRepositoryImpl>((ref) => RequestRepositoryImpl(requestDataSource: RequestDataSourceImpl()));