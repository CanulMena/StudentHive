import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/my_request_studenthivedb.dart';
import 'package:studenthive/infrastructure/models/studenthivedb/your_request_studenthivedb.dart';

class RequestMapper {
  static MyRequest requestStudentHiveDbToEntity(MyRequestModel myRequest) {
    return MyRequest(
      idRequest: myRequest.idRequest,
      idUser: myRequest.userRequestDto.idUser,
      imageUser: myRequest.userRequestDto.profilePhotoUrl ?? '',
      userLastName: myRequest.userRequestDto.lastName ?? '',
      status: myRequest.status,
      userName: myRequest.userRequestDto.name,
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
        userName: yourRequest.requestPublication.requestUser.name,
        userLastName: yourRequest.requestPublication.requestUser.lastName ?? ''
        );
  }
}
