import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/my_request_studenthivedb.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/your_request_studenthivedb.dart';

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

  static YourRequest yourRequestStudentHiveDbToEntity(YourRequestModel yourRequest) {
    return YourRequest(
        idRequest: yourRequest.idRequest,
        status: yourRequest.status,
        idPublication: yourRequest.requestPublication.idPublication,
        title: yourRequest.requestPublication.title,
        rentPrice: yourRequest.requestPublication.rentPrice,
        image: yourRequest.requestPublication.images,
        idUser: yourRequest.requestPublication.requestUser.idUser,
        userName: yourRequest.requestPublication.requestUser.name,
        userLastName: yourRequest.requestPublication.requestUser.lastName ?? ''
        );
  }
}
