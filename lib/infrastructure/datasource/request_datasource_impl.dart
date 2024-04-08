import 'package:dio/dio.dart';
import 'package:studenthive/config/constants/token/manage_token_app.dart';
import 'package:studenthive/domain/datasource/request_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/mappers/my_request_mapper.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/models_studenthivedb.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/your_request_studenthivedb.dart';

class RequestDataSourceImpl extends RequestDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://www.studenthive.somee.com/api/v1',
  ));

  //* con esto obtenemos el token y damos la autorización
  Future<void> _addToken() async {
    String? token = await Token.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  //Funcion para hacer la solicitud de la publicacion
  @override
  Future<void> postRequest(int idUser, int idPublication) async {
    await _addToken();
    //* Realizar la solicitud POST al endpoint
    try {
      Response response = await dio.post('/Request',
      data: {
        'idUser': idUser,
        'idPublication': idPublication
      });

      if (response.statusCode == 200) {
        // Si la solicitud fue exitosa, no necesitamos hacer nada
      } else {
        // Si la respuesta no es exitosa, lanzar una excepción con un mensaje de error
        throw Exception('Error en la solicitud de la publicación: ${response.statusCode}');
      }
    } catch (error) {
      // Manejar la excepción aquí
      // print('Error en el inicio de sesión: $error');
      // Puedes lanzar la excepción nuevamente para que la capa superior la maneje si es necesario
      throw Exception('Error en la solicitud de la publicación: $error');
    }
  }

  @override
  Future<List<MyRequest>> getRequestsByUserId( int idUser ) async {
    await _addToken();
    
    try{
      final response = await dio.get('/Request/MyRequest/$idUser');

      final List<RequestModel> requestStudentHiveDb = response.data.map<RequestModel>((e) => RequestModel.fromJson(e)).toList(); 

      final List<MyRequest> myRequests = requestStudentHiveDb.map((e) => RequestMapper.requestStudentHiveDbToEntity(e)).toList();

      return myRequests;

    } catch (error) {

      return [];
    }
  }
  
  @override
  Future<void> deleteRequest(int idRequest) async {
    await _addToken();
    try {
      Response response = await dio.delete('/Request/$idRequest');

      if (response.statusCode == 200) {
        // Si la solicitud fue exitosa, no necesitamos hacer nada
      } else {
        // Si la respuesta no es exitosa, lanzar una excepción con un mensaje de error
        throw Exception('Error en la solicitud de la publicación: ${response.statusCode}');
      }
    } catch (error) {
      // Manejar la excepción aquí
      // print('Error en el inicio de sesión: $error');
      // Puedes lanzar la excepción nuevamente para que la capa superior la maneje si es necesario
      throw Exception('Error en la solicitud de la publicación: $error');
    }
  }
  
  @override
  Future<List<YourRequest>> getYourRequestsById(int idUser) async {
    await _addToken();
    try {
      final response = await dio.get('/Request/YourRequest/$idUser');

      final List<YourRequestModel> yourRequestStudentHiveDb = response.data.map<YourRequestModel>((e) => YourRequestModel.fromJson(e)).toList();

      final List<YourRequest> yourRequests = yourRequestStudentHiveDb.map((e) => RequestMapper.yourRequestStudentHiveDbToEntity(e)).toList();

      return yourRequests;

    } catch (error) {
      return [];
    }
  }
}