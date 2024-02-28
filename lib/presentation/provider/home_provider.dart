import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider();

  int selectedView = 0;

  bool isLoading = false;

  List<RentalHouse> publications = [
    RentalHouse(
        idPublication: 2,
        title: 'Cuarto en buenas condiciones cerca de la utm',
        description:
            'Irure dolor minim officia ea fugiat eu excepteur magna et nulla ullamco. Ipsum dolor ex laboris incididunt ex elit ipsum. Enim nostrud officia Lorem magna proident enim laborum. Labore est voluptate non ea magna minim sit laborum duis qui.',
        images: [
          'https://i.pinimg.com/564x/25/8c/e9/258ce944a38c11e8a2da9e9e6b378f90.jpg',
          'https://i.pinimg.com/564x/2e/7f/48/2e7f485ebf5e6a539ad3ac8dc07ae13d.jpg',
          'https://i.pinimg.com/564x/0c/e4/c0/0ce4c0bf5bc4ef65b28efbe6c31aef5f.jpg'
        ],
        status: true,
        rentPrice: 1500,
        publicationDate: DateTime.now(),
        rentalHouseDetail: RentalHouseDetail(
            idRentalHouseDetail: 1,
            numberOfGuests: 3,
            numberOfBathrooms: 2,
            numberOfRooms: 2,
            numberOfHammocks: 4),
        houseService: HouseService(
          idHouseService: 1,
          wifi: true, 
          kitchen: true, 
          washer: true, 
          airConditioning: true, 
          water: true, 
          gas: true, 
          television: true
          ),
        houseLocation: HouseLocation(
            idLocation: 1,  
            address: 'C. 59 472',
            city: 'Mérida',
            state: 'Yucatan',
            country: 'México',
            postalCode: '97277',
            neighborhood: 'Mercedes Barrera'
            ),
        idUser: '1', typeHouseRental: ''
        ),

    RentalHouse(
        idPublication: 1,
        title: 'Busco Gente responsable',
        description:
            'Irure dolor minim officia ea fugiat eu excepteur magna et nulla ullamco. Ipsum dolor ex laboris incididunt ex elit ipsum. Enim nostrud officia Lorem magna proident enim laborum. Labore est voluptate non ea magna minim sit laborum duis qui.',
        images: [
          'https://i.pinimg.com/564x/99/2d/1a/992d1a380ae061ad25c779990a95930a.jpg',
          'https://i.pinimg.com/564x/dc/16/80/dc1680e3656140da0ef1b57feaa095e3.jpg',
          'https://i.pinimg.com/564x/e8/1d/83/e81d836940072815e686eb83b78efac1.jpg',
        ],
        status: true,
        rentPrice: 1300,
        publicationDate: DateTime.now(),
        rentalHouseDetail: RentalHouseDetail(
            idRentalHouseDetail: 1,
            numberOfGuests: 2,
            numberOfBathrooms: 1,
            numberOfRooms: 2,
            numberOfHammocks: 4),
        houseService: HouseService(
          idHouseService: 2, 
          wifi: true, 
          kitchen: false, 
          washer: false, 
          airConditioning: true, 
          water: true, 
          gas: true, 
          television: true
        ),
        houseLocation: HouseLocation(
            idLocation: 2,  
            address: 'C. 59 472',
            city: 'Mérida',
            state: 'Yucatan',
            country: 'México',
            postalCode: '97277',
            neighborhood: 'Mercedes Barrera'
            ),
        idUser: '1', typeHouseRental: ''),

    RentalHouse(
        idPublication: 2,
        title: 'Busco Gente responsable',
        description:
            'Irure dolor minim officia ea fugiat eu excepteur magna et nulla ullamco. Ipsum dolor ex laboris incididunt ex elit ipsum. Enim nostrud officia Lorem magna proident enim laborum. Labore est voluptate non ea magna minim sit laborum duis qui.',
        images: [
          'https://i.pinimg.com/564x/99/2d/1a/992d1a380ae061ad25c779990a95930a.jpg',
          'https://i.pinimg.com/564x/dc/16/80/dc1680e3656140da0ef1b57feaa095e3.jpg',
          'https://i.pinimg.com/564x/e8/1d/83/e81d836940072815e686eb83b78efac1.jpg',
        ],
        status: true,
        rentPrice: 1300,
        publicationDate: DateTime.now(),
        rentalHouseDetail: RentalHouseDetail(
            idRentalHouseDetail: 1,
            numberOfGuests: 2,
            numberOfBathrooms: 1,
            numberOfRooms: 2,
            numberOfHammocks: 4),
        houseService: HouseService(
          idHouseService: 2, 
          wifi: false, 
          kitchen: false, 
          washer: false, 
          airConditioning: false, 
          water: false, 
          gas: false, 
          television: false
        ),
        houseLocation: HouseLocation(
            idLocation: 2,  
            address: 'C. 59 472',
            city: 'Mérida',
            state: 'Yucatan',
            country: 'México',
            postalCode: '97277',
            neighborhood: 'Mercedes Barrera'
            ),
        idUser: '1', typeHouseRental: ''),





  ];

  void selectView(int viewPage) {
    selectedView = viewPage;
    notifyListeners();
  }

  // Future<void> getPublications() async {
  //   final List<Publication> newPublications =  await publicationRepositoriesImpl.getInformationPublication();

  //   publications.addAll(newPublications);
  //   isLoading = false;
  //   notifyListeners();
  // }
}
