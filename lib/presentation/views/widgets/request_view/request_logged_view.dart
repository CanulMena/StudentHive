import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/favorites_view/list_empty.dart';
import 'package:studenthive/presentation/views/widgets/request_view/reques_list_no_empty.dart';

class RequestViewLogged extends StatelessWidget {
  final List<HousePreview> favorites;
  final Size size;
  const RequestViewLogged(
      {super.key, required this.favorites, required this.size});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Solicitudes',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            favorites.isEmpty
                ? const ListEmpty()
                : ListEmptyNoRequest(
                    size: size,
                    favorites: favorites,
                  )
          ],
        )
      ],
    );
  }
}
