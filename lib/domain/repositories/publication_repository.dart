
import 'package:studenthive/domain/entities/publication.dart';

abstract class PublicationRepository {
  
  Future<List<RentalHouse>> getInformationPublication();

}