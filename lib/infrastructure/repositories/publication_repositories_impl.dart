
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/domain/repositories/publication_repository.dart';
import 'package:studenthive/infrastructure/datasource/publication_datasource_impl.dart';

class PublicationRepositoriesImpl extends PublicationRepository {
  
  final PublicationDataSourceImpl publicationDataSourceImpl;

  PublicationRepositoriesImpl({
    required this.publicationDataSourceImpl
  });

  @override
  Future<List<Publication>> getInformationPublication() {
  return publicationDataSourceImpl.getInformationPublication();  
  }

}