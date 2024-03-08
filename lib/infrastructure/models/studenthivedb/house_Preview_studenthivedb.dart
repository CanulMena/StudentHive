import 'dart:convert';

StudentHiveDbResponse houseStudenthiveDbFromJson(String str) => StudentHiveDbResponse.fromJson(json.decode(str));

String houseStudenthiveDbToJson(StudentHiveDbResponse data) => json.encode(data.toJson());

class StudentHiveDbResponse {
    final int page;
    final List<HousePreviewStudentHiveDb> results;
    final int totalPages;
    final int totalResults;

    StudentHiveDbResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory StudentHiveDbResponse.fromJson(Map<String, dynamic> json) => StudentHiveDbResponse(
        page: json["page"],
        results: List<HousePreviewStudentHiveDb>.from(json["results"].map((x) => HousePreviewStudentHiveDb.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class HousePreviewStudentHiveDb {
    final int idPublication;
    final String title;
    final String nameofUser;
    final List<String> images;
    final int rentPrice;
    final DateTime publicationDate;

    HousePreviewStudentHiveDb({
        required this.idPublication,
        required this.title,
        required this.nameofUser,
        required this.images,
        required this.rentPrice,
        required this.publicationDate,
    });

    factory HousePreviewStudentHiveDb.fromJson(Map<String, dynamic> json) => HousePreviewStudentHiveDb(
        idPublication: json["idPublication"],
        title: json["title"],
        nameofUser: json["nameofUser"],
        images: List<String>.from(json["images"].map((x) => x)),
        rentPrice: json["rentPrice"],
        publicationDate: DateTime.parse(json["publicationDate"]),
    );

    Map<String, dynamic> toJson() => {
        "idPublication": idPublication,
        "title": title,
        "nameofUser": nameofUser,
        "images": List<dynamic>.from(images.map((x) => x)),
        "rentPrice": rentPrice,
        "publicationDate": publicationDate.toIso8601String(),
    };
}
