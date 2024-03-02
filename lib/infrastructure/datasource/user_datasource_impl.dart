import 'package:dio/dio.dart';
import 'package:studenthive/domain/datasource/user_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/user_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';

class UserDataSourceImpl extends UserDataSource {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://studenthivepro.somee.com/api',
        
    )
  );

  @override
  Future<void> postUser( String userName, String password, String email ) async { //* This just is to do add the account
    try {
    // Realizar la solicitud POST al endpoint
    Response response = await dio.post(
      '/User', 
      data: {
        "email": email,
        "password": password,
        "name": userName
        }
      );

    //* Comprobamos que la solicitud fue exitosa
    if (response.statusCode == 200) {
      //*En este caso no es necesario regresar nada
    } else {
      
      throw Exception('Error al crear usuario: ${response.statusCode}');
    }
  } catch (e) {
    //* Manejar cualquier error inesperado
    throw Exception('Error al crear usuario: $e');
  }
  }

  @override
  Future<User> getUserByEmail( String email ) async {
    final response = await dio.get('/User/email/$email');

    final users = Users.fromJson(response.data);//* Here i convert the json to Users 
    //i need to convert users to my entity user.
    final User user = UserMapper.userToEntity(users);
    return user;
  }
  
  @override
  Future<User> getUserById( int id ) async {
    final response = await dio.get('/User/id/$id');

    final users = Users.fromJson(response.data);//* Here i convert the json to Users 
    //i need to convert users to my entity user.
    final User user = UserMapper.userToEntity(users);
    return user;
  }
  
}