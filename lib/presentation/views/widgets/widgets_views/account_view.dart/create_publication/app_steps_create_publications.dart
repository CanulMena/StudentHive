import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/screen_create_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/house_add_description.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/house_add_title.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/house_price.dart';

class AppStepsCreatePublications extends StatefulWidget {
  const AppStepsCreatePublications({super.key});

  @override
  State<AppStepsCreatePublications> createState() =>
      _AppStepsCreatePublicationsState();
}

class _AppStepsCreatePublicationsState
    extends State<AppStepsCreatePublications> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
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
          )
        ],
      ),
    );
  }
}
