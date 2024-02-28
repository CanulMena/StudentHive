import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/conatiner_details_publication.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? clase creada en la carpeta utils_for_creation_publication
          const TitleAppbar(
              title: 'Incorpora información esencial a tu espacio'),
          const SizedBox(height: 30),
          ContainerDetailHouse(
            text: 'Visitantes',
            iconMore: Icons.add,
            iconLess: Icons.remove,
            counter: visitantes,
            onIncrement: incrementGuests,
            onDecrement: decrementGuests,
          ),
          const SizedBox(height: 20),
          ContainerDetailHouse(
            text: 'Cuartos',
            iconMore: Icons.add,
            iconLess: Icons.remove,
            counter: cuartos,
            onIncrement: incrementRoom,
            onDecrement: decrementRoom,
          ),
          const SizedBox(height: 20),
          ContainerDetailHouse(
            text: 'Camas',
            iconMore: Icons.add,
            iconLess: Icons.remove,
            counter: camas,
            onIncrement: incrementBed,
            onDecrement: decrementBed,
          ),
          const SizedBox(height: 20),
          ContainerDetailHouse(
            text: 'Hamaqueros',
            iconMore: Icons.add,
            iconLess: Icons.remove,
            counter: hamaqueros,
            onIncrement: incrementHammock,
            onDecrement: decrementHammock,
          ),
          const SizedBox(height: 20),
          ContainerDetailHouse(
            text: 'Baños',
            iconMore: Icons.add,
            iconLess: Icons.remove,
            counter: banos,
            onIncrement: incrementBatroom,
            onDecrement: decrementBatroom,
          ),
        ],
      ),
    );
  }
}
