import 'package:dio/dio.dart';
import 'package:studenthive/config/constants/token/manage_token_app.dart';
import 'package:studenthive/domain/datasource/user_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/user_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/studenthivedb_users.dart';

///* Podemos hacer muchos tipos de peticiones a la API cuando tenemos que pasar parametros. 
///* 1. QueryParameters: Son los parametros que se pasan en la URL, por ejemplo: /User/email/$email
/// 2. Data: Son los parametros que se pasan en el cuerpo de la petición, por ejemplo: data: { "email": email, "password": password, }
/// 3. Headers: Son los parametros que se pasan en la cabecera de la petición, por ejemplo: dio.options.headers['Authorization
/// 4. PathParameters: Son los parametros que se pasan en la URL, pero se pasan de una forma diferente a los QueryParameters, por ejemplo: /User/id/$id
/// 5. FormData: Son los parametros que se pasan en el cuerpo de la petición, pero se pasan de una forma diferente a los Data, por ejemplo: FormData.fromMap({ "email": email, "password": password, })
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
  Future<void> postUser( String userName, String password, String email ) async {

    try { //* Cosas que no debo de pasar en la url son: contraseñas, tokens, credenciales, etc.
    Response response = await dio.post( //* Estoy pasando datos como queryParameters y esto se convierte directamete en la url de la petición
      '/User', //* Por lo tanto estas practicas son malas, ya que la información se puede ver en la url si alguien la intercepta
        queryParameters: { //* Por lo tanto, es mejor pasar los datos como data, ya que estos se pasan en el cuerpo de la petición
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