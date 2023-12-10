import 'package:dio/dio.dart';
import 'package:studenthive/domain/datasource/publication_datasource.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/models/local_publication_image_model.dart';

class PublicationDataSourceImpl extends PublicationDataSource {
  final Dio dio = Dio();
  @override
  Future<List<Publication>> getInformationPublication() async {
    try {
    final response = await dio.get('https://studenthive.somee.com/api/Publicaciones');
    final List<dynamic> jsonList = response.data as List<dynamic>;

    // Mapear la lista de JSON a una lista de instancias de LocalPublicationImageModel
    final List<LocalPublicationImageModel> publicationModels = jsonList.map((json) {
      return LocalPublicationImageModel.fromJson(json);
    }).toList();

    // Mapear la lista de modelos locales a una lista de instancias de Publication
    final List<Publication> publications = publicationModels.map((model) {
      return model.toImagePost();
    }).toList();

    return publications;

  } catch (error) {
    
    throw Exception('Error en la solicitud GET: $error');
  }
}

  }

