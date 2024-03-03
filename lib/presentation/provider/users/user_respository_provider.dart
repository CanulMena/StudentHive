import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/infrastructure/datasource/user_datasource_impl.dart';
import 'package:studenthive/infrastructure/repositories/users_repository_impl.dart';

//agregamos el valor que tendrá la avariable del provider.
final usersRepositoryProvider = Provider<UserRepositoryImpl>((ref) => UserRepositoryImpl(userDataSource: UserDataSourceImpl()));  