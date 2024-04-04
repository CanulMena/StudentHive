import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/request_studenhivedb.dart';

class RequestMapper {
  static MyRequest requestStudentHiveDbToEntity(RequestModel myRequest) {
    return MyRequest(
        idRequest: myRequest.idRequest,
        idPublication: myRequest.requestPublicationDto.idPublication,
        userLastName: myRequest.requestPublicationDto.requestUserDto.lastName,
        status: myRequest.status,
        title: myRequest.requestPublicationDto.title,
        rentPrice: myRequest.requestPublicationDto.rentPrice,
        userName: myRequest.requestPublicationDto.requestUserDto.name,
        image: myRequest.requestPublicationDto.images,
        );
  }
}
