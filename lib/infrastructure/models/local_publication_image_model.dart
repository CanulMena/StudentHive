import 'package:studenthive/domain/entities/publication.dart';

class LocalPublicationImageModel {
  String title;
  String imageUrl;
  String date;
  int price;

  LocalPublicationImageModel({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.price
  });
  //*Estamos creando una constructor con nombre que se llama fromJson y retornará el contructor de la clase. Y pedirá como parametros un json.
  factory LocalPublicationImageModel.fromJson( Map<String, dynamic> json ){
    return LocalPublicationImageModel(
      title : json['title'],
      imageUrl : json['imageUrl'],
      date : json['date'],
      price : json['price'],
    );
  }
  
  Publication toImagePost(){
    return Publication(
      title: title, 
      imageUrl: imageUrl, 
      date: date, 
      price: price);
  }
}
