import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/favorites_view/list_empty.dart';
import 'package:studenthive/presentation/views/widgets/request_view/reques_list_no_empty.dart';

class RequestViewLogged extends StatelessWidget {
  final List<MyRequest> myRequests;
  final Future<void> Function(int) removeRequest;
  // final Size size;
  const RequestViewLogged(
      {super.key,
      required this.myRequests,
      // required this.size,
      required this.removeRequest});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Solicitudes',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        myRequests.isEmpty
            ? const ListEmpty()
            : ListEmptyNoRequest(
                // size: size,
                myRequests: myRequests,
                removeRequest: removeRequest,
              )
      ],
    );
  }
}
