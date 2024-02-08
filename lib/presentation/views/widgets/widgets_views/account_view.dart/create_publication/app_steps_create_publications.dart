import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/screen_create_publication.dart';

class AppStepsCreatePublications extends StatefulWidget {
  const AppStepsCreatePublications({super.key});

  @override
  State<AppStepsCreatePublications> createState() =>
      _AppStepsCreatePublicationsState();
}

class _AppStepsCreatePublicationsState
    extends State<AppStepsCreatePublications> {
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
              child: StepProgess(currentStep: _currentPage, steps: 11),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  TypeHouse(),
                  HouseLocation(),
                  DetailsHouse(),
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
