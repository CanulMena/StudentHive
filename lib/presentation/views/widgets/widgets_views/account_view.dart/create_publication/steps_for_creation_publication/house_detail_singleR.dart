import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/create_publication_provider.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/conatiner_details_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class DetailsSingleHouse extends StatelessWidget {
  final PageController pageController;

  const DetailsSingleHouse({super.key, required this.pageController, });
  
  @override
  Widget build(BuildContext context) {
    final createPublication = context.watch<CreatePublicationProvider>();
    bool isButtonEnabled = 
    createPublication.batrooms > 0 ;
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
              counter: createPublication.guests,
              onIncrement: createPublication.incrementGuests,
              onDecrement: createPublication.decrementGuests,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Camas',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: createPublication.beeds,
              onIncrement: createPublication.incrementBed,
              onDecrement: createPublication.decrementBed,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Hamaqueros',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: createPublication.hammocks,
              onIncrement: createPublication.incrementHammock,
              onDecrement: createPublication.decrementHammock,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Baños',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: createPublication.batrooms,
              onIncrement: createPublication.incrementBatroom,
              onDecrement: createPublication.decrementBatroom,
            ),
          ],
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          // Mostrar el bottomNavigationBar solo si el teclado no está abierto
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP( pageController: pageController, isButtonEnabled: isButtonEnabled,);
        },
      ),
    );
  }
  

}
