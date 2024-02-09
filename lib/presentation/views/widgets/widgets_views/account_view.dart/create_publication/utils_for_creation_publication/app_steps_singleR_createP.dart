import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/screen_create_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/house_detail_singleR.dart';

class AppStepsCreateSinglePublications extends StatefulWidget {
  const AppStepsCreateSinglePublications({super.key});

  @override
  State<AppStepsCreateSinglePublications> createState() =>
      _AppStepsCreateSinglePublicationsState();
}

class _AppStepsCreateSinglePublicationsState
    extends State<AppStepsCreateSinglePublications> {
  final PageController _pageController = PageController();

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: StepProgess(currentStep: _currentPage, steps: 10),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  HouseLocation(),
                  DetailsSingleHouse(),
                  WhoElse(),
                  HouseService(),
                  AddHouseImages(),
                  ViewImages(),
                  HouseAddTittle(),
                  HouseAddDescription(),
                  HousePrice(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomButtons(
          pageController: _pageController,
        ));
  }
}
