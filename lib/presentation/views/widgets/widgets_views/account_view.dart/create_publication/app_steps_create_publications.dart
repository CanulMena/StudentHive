import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_make_reservation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/screen_create_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/house_detail_singler.dart';

class AppStepsCreatePublications extends StatefulWidget {
  const AppStepsCreatePublications({super.key});

  @override
  State<AppStepsCreatePublications> createState() =>
      _AppStepsCreatePublicationsState();
}

class _AppStepsCreatePublicationsState
    extends State<AppStepsCreatePublications> {
  final PageController pageController = PageController();

  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: StepProgess(currentStep: currentPage, steps: 10),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                HouseLocation(
                  pageController: pageController,
                ),
                DetailsSingleHouse(
                  pageController: pageController,
                ),
                WhoElse(
                  pageController: pageController,
                ),
                HouseService(
                  pageController: pageController,
                ),
                AddHouseImages(
                  pageController: pageController,
                ),
                ViewImages(
                  pageController: pageController,
                ),
                HouseAddTittle(
                  pageController: pageController,
                ),
                HouseAddDescription(
                  pageController: pageController,
                ),
                HousePrice(
                  pageController: pageController,
                ),
                MakeReservationView(
                  pageController: pageController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
