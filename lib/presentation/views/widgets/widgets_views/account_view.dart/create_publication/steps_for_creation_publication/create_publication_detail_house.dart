import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/navbar_button.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/conatiner_details_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/steps_for_creation_publication/create_publication_who_else.dart';

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
      visitantes = visitantes > 0 ? visitantes - 1 : 0;
    });
  }

  void decrementRoom() {
    setState(() {
      cuartos = cuartos > 0 ? cuartos - 1 : 0;
    });
  }

  void decrementBed() {
    setState(() {
      camas = camas > 0 ? camas - 1 : 0;
    });
  }

  void decrementHammock() {
    setState(() {
      hamaqueros = hamaqueros > 0 ? hamaqueros - 1 : 0;
    });
  }

  void decrementBatroom() {
    setState(() {
      banos = banos > 0 ? banos - 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Incorpora información esencial a tu espacio',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ContainerDetailHouse(
              text: 'Número de visitantes',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: visitantes,
              onIncrement: incrementGuests,
              onDecrement: decrementGuests,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Número de cuartos',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: cuartos,
              onIncrement: incrementRoom,
              onDecrement: decrementRoom,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Número de camas',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: camas,
              onIncrement: incrementBed,
              onDecrement: decrementBed,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Número de hamaqueros',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: hamaqueros,
              onIncrement: incrementHammock,
              onDecrement: decrementHammock,
            ),
            const SizedBox(height: 20),
            ContainerDetailHouse(
              text: 'Número de baños',
              iconMore: Icons.add,
              iconLess: Icons.remove,
              counter: banos,
              onIncrement: incrementBatroom,
              onDecrement: decrementBatroom,
            ),
            const SizedBox(height: 200),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                CustomNavBarButton(
                  label: 'Atras',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 90),
                CustomNavBarButton(
                  label: 'Siguiente',
                  onPressed: () {
                    Navigator.of(context)
                        .push(createPageRoute(const DataPerson()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
