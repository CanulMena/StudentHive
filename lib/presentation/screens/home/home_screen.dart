import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/home/home_loading_fetchs.dart';
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

  void _loadFavoritesFromSharedPreferences() { //TODO: Ver la parte de favoritos despues
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
        loadNextPage: () => ref.read(allHousesPreviewProvider.notifier).loadNextPage(),
      ),
      FavoriteView(
        isTokenAut: isTokenAut,
        favorites: favorites,
      ),
      const NotificationView(),
      const AcountView(),
    ];

    final initialLoading = ref.watch(initialLoadingProvider);
    if( initialLoading ) return const FullScreenLoading();

    return Scaffold(
      body: IndexedStack(
        index: ref.watch(
            selectedViewProvider), //* Esta como whats por que estará pendiente de los cambios?
        children: screens,
      ),
      bottomNavigationBar: CustomButtomNavegationBar(
        selectIndex: (value) => ref.read(selectedViewProvider.notifier).state = value, 
        selectedIndex: ref.watch(selectedViewProvider), // --> activamos la funcion
      ),
    );
  }
}
