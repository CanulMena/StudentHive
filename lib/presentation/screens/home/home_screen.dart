import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/presentation/provider/house/house_provider.dart';
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
    _loadFavoritesFromSharedPreferences();
    ref.read(allHousesPreviewProvider.notifier).loadNextPage();
    super.initState();
  }

  void _loadFavoritesFromSharedPreferences() {
    ref
        .read(favoritesHousesProvider.notifier)
        .loadFavoritesFromSharedPreferences();
  }

  @override
  build(BuildContext context) {
    final bool isTokenAut = ref.read(isTokenAuthProvider); //*Mientras estoy en el home se lee la variable cuando se construye el widget
    final List<House> favorites = ref.watch(favoritesHousesProvider);
    final List<HousePreview> houses = ref.watch(allHousesPreviewProvider);
  

    List<Widget> screens = [
      PublicationsView(
        listHousePreview: houses,
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
