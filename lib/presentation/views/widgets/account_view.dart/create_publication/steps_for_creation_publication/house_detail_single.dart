import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/detail_house_provider.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/conatiner_details_publication.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class DetailsSingleHouse extends ConsumerStatefulWidget {
  final PageController pageController;

  const DetailsSingleHouse({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<DetailsSingleHouse> createState() => _DetailsSingleHouseState();
}

class _DetailsSingleHouseState extends ConsumerState<DetailsSingleHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleAppbar(
                title: 'Incorpora información esencial a tu espacio'),
            const SizedBox(height: 30),
            ContainerDetailHouse(
              text: 'Visitantes',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: ref.read(detailHouseProvider).numberOfVisitors,
              onIncrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).incrementVisitors();
              },
              onDecrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).decrementVisitors();
              },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Camas',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: ref.read(detailHouseProvider).numberOfBeds,
              onIncrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).incrementBeds();
              },
              onDecrement: () {
                ref.read(detailHouseProvider.notifier).decrementBeds();
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Hamaqueros',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: ref.read(detailHouseProvider).numberOfHammocks,
              onIncrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).incrementHammocks();
              },
              onDecrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).decrementHammocks();
              },
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Baños',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: ref.read(detailHouseProvider).numberOfBathrooms,
              onIncrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).incrementBathrooms();
              },
              onDecrement: () {
                setState(() {});
                ref.read(detailHouseProvider.notifier).decrementBathrooms();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible
              ? const SizedBox()
              : ButtomStepscreateP(
                  pageController: widget.pageController,
                  isButtonEnabled: true,
                  onNext: () {},
                );
        },
      ),
    );
  }
}
