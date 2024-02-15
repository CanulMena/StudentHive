import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_details_pay.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_details_reservation.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_imagenad_title_publication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/view_confirmed_reservation/view_pay_reservation.dart';

class MakeReservationView extends StatelessWidget {
  const MakeReservationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmar la reservación'),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  ContainerImageAndTitle(),
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
              )
            ],
          ),
        ));
  }
}
