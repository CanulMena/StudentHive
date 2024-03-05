import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/rentalhouse.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/widgets/home/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _loadFavoritesFromSharedPreferences();
  }

  void _loadFavoritesFromSharedPreferences() {
    ref
        .read(favoritesPostsProvider.notifier)
        .loadFavoritesFromSharedPreferences();
  }

  @override
  build(BuildContext context) {
    final bool isTokenAut = ref.read(
        isTokenAuthProvider); //*Mientras estoy en el home se lee la variable cuando se construye el widget
    final List<RentalHouse> favorites = ref.watch(favoritesPostsProvider);

    List<RentalHouse> publications = [
      RentalHouse(
          idPublication: 1,
          title: 'The best Publication',
          description:
              'Mollit ut voluptate ex elit fugiat sunt tempor aliquip eu. Ut ut consectetur qui quis incididunt commodo et exercitation. Officia enim irure nulla qui laborum ea. Nostrud aute irure duis id do.',
          whoElse: 'El',
          rentPrice: 1500,
          typeHouse: 'Propia',
          idUser: 1,
          publicationDate: DateTime.now(),
          houseService: HouseService(
              idHouseService: 1,
              wifi: true,
              kitchen: true,
              washer: true,
              airConditioning: true,
              water: true,
              gas: true,
              television: true),
          location: Location(
              idLocation: 1,
              address: 'Calle 111b x 52a y 54',
              city: 'Merida',
              state: 'Yucatan',
              country: 'Mexico',
              postalCode: 97277,
              neighborhood: 'Mercedse'),
          rentalHouseDetail: RentalHouseDetail(
              idRentalHouseDetail: 1,
              numberOfGuests: 1,
              numberOfBathrooms: 1,
              numberOfRooms: 2,
              numbersOfBed: 2,
              numberOfHammocks: 3),
          image: HouseImage(
            idImage: 1, 
            urlImageHouse:  'https://i.pinimg.com/564x/99/2d/1a/992d1a380ae061ad25c779990a95930a.jpg',
            )),
    ];

    List<Widget> screens = [
      PublicationsView(
        listPublications: publications,
      ),
      FavoriteView(
        isTokenAut: isTokenAut,
        favorites: favorites,
      ),
      const NotificationView(),
      const AcountView(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: ref.watch(
            selectedViewProvider), //* Esta como whats por que estará pendiente de los cambios?
        children: screens,
      ),
      bottomNavigationBar: CustomButtomNavegationBar(
        selectIndex: (value) => ref.read(selectedViewProvider.notifier).state =
            value, //*Por que este es ref.read?
        selectedIndex: ref.watch(selectedViewProvider),
      ),
    );
  }
}
