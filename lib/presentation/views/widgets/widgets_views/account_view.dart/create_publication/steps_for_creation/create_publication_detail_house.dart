import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation/conatiner_details_publication.dart';

class DetailsHouse extends StatefulWidget {
  const DetailsHouse({super.key});

  @override
  State<DetailsHouse> createState() => _DetailsHouseState();
}

class _DetailsHouseState extends State<DetailsHouse> {
  int visitantes = 0;
  int cuartos = 0;
  int camas = 0;
  int hamaqueros = 0;
  int banos = 0;

  void incrementGuests() {
    setState(() {
      visitantes++;
    });
  }

  void incrementRoom() {
    setState(() {
      cuartos++;
    });
  }

  void incrementBed() {
    setState(() {
      camas++;
    });
  }

  void incrementHammock() {
    setState(() {
      hamaqueros++;
    });
  }

  void incrementBatroom() {
    setState(() {
      banos++;
    });
  }

  void decrementGuests() {
    setState(() {
      visitantes--;
      if (visitantes < 0) {
        visitantes = 0;
      }
    });
  }

  void decrementRoom() {
    setState(() {
      cuartos--;
      if (cuartos < 0) {
        cuartos = 0;
      }
    });
  }

  void decrementBed() {
    setState(() {
      camas--;
      if (camas < 0) {
        camas = 0;
      }
    });
  }

  void decrementHammock() {
    setState(() {
      hamaqueros--;
      if (hamaqueros < 0) {
        hamaqueros = 0;
      }
    });
  }

  void decrementBatroom() {
    setState(() {
      banos--;
      if (banos < 0) {
        banos = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Text('Incorpora información esencial a tu espacio'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Número de visitantes',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: visitantes,
              onIncrement: incrementGuests,
              onDecrement: decrementGuests,
            ),
            const SizedBox(height: 15),
            ContainerDetailHouse(
              text: 'Número de cuartos',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: cuartos,
              onIncrement: incrementRoom,
              onDecrement: decrementRoom,
            ),
            const SizedBox(height: 15),
            ContainerDetailHouse(
              text: 'Número de camas',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: camas,
              onIncrement: incrementBed,
              onDecrement: decrementBed,
            ),
            const SizedBox(height: 15),
            ContainerDetailHouse(
              text: 'Número de hamaqueros',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: hamaqueros,
              onIncrement: incrementHammock,
              onDecrement: decrementHammock,
            ),
            const SizedBox(height: 15),
            ContainerDetailHouse(
              text: 'Número de baños',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: banos,
              onIncrement: incrementBatroom,
              onDecrement: decrementBatroom,
            ),
            const SizedBox(height: 210),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                CustomNavBarButton(
                    label: 'Atras',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(width: 100),
                CustomNavBarButton(
                  label: 'Siguiente',
                  onPressed: () {
                    Navigator.of(context)
                        .push(createPageRoute(const DetailsHouse()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
