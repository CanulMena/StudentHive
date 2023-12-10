import 'package:studenthive/domain/entities/publication.dart';

abstract class PublicationDataSource {

  Future<List<Publication>> getInformationPublication();

}