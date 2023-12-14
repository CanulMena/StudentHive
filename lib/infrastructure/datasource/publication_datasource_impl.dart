import 'package:dio/dio.dart';
import 'package:studenthive/domain/datasource/publication_datasource.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/infrastructure/models/local_publication_image_model.dart';

class PublicationDataSourceImpl extends PublicationDataSource {

  final Dio dio = Dio();
  
  @override
  Future<List<Publication>> getInformationPublication() async {

    final response = await dio.get('https://studenthive.somee.com/api/Publicaciones');
    final List<dynamic> jsonDynamicList = response.data; //*Tenemos que pasarle la data del reponse
                                          
    final List<Publication> publications = jsonDynamicList.map((map){ //estoy convirtiendo sus index en listas?????
      return PublicationModel.fromJson(map).toPublicationPost();
    }).toList();

    return publications;
    
}

  }

