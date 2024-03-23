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
    _pageController =
        PageController(initialPage: ref.read(selectedViewProvider));
    ref.read(allHousesPreviewProvider.notifier).loadNextPage();
    ref.read(userProvider.notifier).loadUserFromSharedPreferences();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTokenAut = ref.read(isTokenAuthProvider);
    final List<HousePreview> houses = ref.watch(allHousesPreviewProvider);

    List<Widget> screens = [
      PublicationsView(
        listHousePreview: houses,
        loadNextPage: () =>
            ref.read(allHousesPreviewProvider.notifier).loadNextPage(),
      ),
      FavoriteView(isTokenAut: isTokenAut),
      // const NotificationView(),
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
