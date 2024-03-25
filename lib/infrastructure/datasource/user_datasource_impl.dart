import 'package:dio/dio.dart';
import 'package:studenthive/config/constants/token/manage_token_app.dart';
import 'package:studenthive/domain/datasource/user_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/user_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';

class UserDataSourceImpl extends UserDataSource {

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://www.studenthive.somee.com/api',
  )
);

Future<void> _addToken() async {
  String? token = await Token.getToken();
  dio.options.headers['Authorization'] = 'Bearer $token';
}

@override
Future<void> loginUser(String email, String password) async {
  try {
    // Realizar la solicitud de inicio de sesión
    Response response = await dio.post(
      '/User/login',
      data: {
        "email": email,
        "password": password,
      },
    );

    // Verificar el código de estado de la respuesta
    if (response.statusCode == 200) {
      // Si el inicio de sesión fue exitoso, obtener el token y guardarlo
      String token = response.data;
      await Token.saveToken(
        token, 
        DateTime.now().millisecondsSinceEpoch
        );
      
    } else {
      // Si la respuesta no es exitosa, lanzar una excepción con un mensaje de error
      throw Exception('Error en el inicio de sesión: ${response.statusCode}');
    }
  } catch (error) {
    // Manejar la excepción aquí
    // print('Error en el inicio de sesión: $error');
    // Puedes lanzar la excepción nuevamente para que la capa superior la maneje si es necesario
    
  }
}


  @override
  Future<void> postUser( String userName, String password, String email ) async { //* This just is to do add the account
    try {
    //* Realizar la solicitud POST al endpoint
    Response response = await dio.post(
      '/User',
      queryParameters: {
        "Email": email,
        "IdRol": 1,
        "Password": password,
        "Name": userName,
      },
    );

    if (response.statusCode == 201) {
      
    } 
    }catch (e) { //? e ---> generalmente solo contiene información sobre el tipo de error que ocurrió. No un estatus http
    // print('error exeption $e');
    throw Exception('Error al crear usuario: $e');
    }
  }

  @override
  Future<User> getUserByEmail( String email ) async {
    await _addToken();
    final response = await dio.get(
      '/User/email/$email',
      );

    final users = UserModel.fromJson(response.data);//* Here i convert the json to Users 
    //i need to convert users to my entity user.
    final User user = UserMapper.userToEntity(users);
    return user;
  }

  @override
  Future<User> getUserById( int id ) async {
    await _addToken();
    final response = await dio.get('/User/id/$id');

    final users = UserModel.fromJson(response.data);//* Here i convert the json to Users 
    //i need to convert users to my entity user.
    final User user = UserMapper.userToEntity(users);
    return user;
  }

}