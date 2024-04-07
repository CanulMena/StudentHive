import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/home/home_loading_fetchs.dart';
import 'package:studenthive/presentation/screens/widgets/home/custom_bottom_navegation_bar.dart';
import 'package:studenthive/presentation/views/home_views.dart';
import 'package:studenthive/presentation/views/home_views/request_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: ref.read(selectedViewProvider));

    ref.read(allHousesPreviewProvider.notifier).loadNextPage(); //* Todas las casas de la base de datos
    ref.read(userProvider.notifier).loadUserFromSharedPreferences(); // Cargar usuario

    ref.read(allActiveHousesPreviewProvider.notifier).loadNextPage(); // Todas las casas activas de la base de datos
    ref.read(allActiveHousesPreviewProviderByUser.notifier).loadNextPage(); // Todas las casas activas del usuario
    ref.read(allInactiveHousesPreviewProviderByUser.notifier).loadNextPage(); // Todas las casas inactivas del usuario
    ref.read(allHousesPreviewProviderByUser.notifier).loadNextPage(); // Todas las casas del usuario

    // ref.read(requestProvider.notifier).getAllMyRequests(ref.read(userProvider)!.idUser); // Todas las solicitudes del usuario
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTokenAut = ref.read(isTokenAuthProvider);
    final List<HousePreview> activeHouses = ref.watch(allActiveHousesPreviewProvider);

    List<Widget> screens = [
      PublicationsView(
        listHousePreview: activeHouses,
        loadNextPage: () =>
            ref.read(allHousesPreviewProvider.notifier).loadNextPage(),
      ),
      FavoriteView(isTokenAut: isTokenAut),
      RequestView(
        isTokenAut: isTokenAut,
      ),
      const AcountView(),
    ];

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoading(); 

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) =>
            ref.read(selectedViewProvider.notifier).state = value,
        children: screens,
      ),
      bottomNavigationBar: CustomButtomNavegationBar(
        selectIndex: (value) => _pageController.jumpToPage(value),
        selectedIndex: ref.watch(selectedViewProvider),
      ),
    );
  }
}
