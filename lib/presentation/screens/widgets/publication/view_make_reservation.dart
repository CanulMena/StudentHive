import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_details_pay.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_details_reservation.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_imagenad_title_publication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_pay_reservation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';

class MakeReservationView extends StatelessWidget {
  final PageController pageController;
  const MakeReservationView({
    super.key, required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                const ContainerImageAndTitle(),
                const SizedBox(
                  height: 20,
                ),
                const ContainerDetailsReservation(),
                const SizedBox(
                  height: 20,
                ),
                const ContainerDetailPay(),
                const SizedBox(
                  height: 20,
                ),
                const ContainerPayReservation(),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.amber))),
                  child: const Text('Confirmar Reservar',
                      style: TextStyle(fontSize: 20, color: Colors.amber)),
                )
              ],
            ),
            
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible ? const SizedBox() : ButtomStepscreateP(  pageController: pageController, onNext: () {  }, );
        },
      ),
    );
  }
}
