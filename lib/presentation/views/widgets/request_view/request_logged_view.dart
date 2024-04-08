import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/request_view/reques_list_no_empty.dart';
import 'package:studenthive/presentation/views/widgets/request_view/request_list_empty.dart';

class RequestViewLogged extends StatefulWidget {
  final List<MyRequest> myRequests;
  final List<YourRequest> yourRequests;
  final Future<void> Function(int) removeRequest;
  const RequestViewLogged({
    super.key,
    required this.myRequests,
    required this.removeRequest,
    required this.yourRequests
    });

  @override
  State<RequestViewLogged> createState() => _RequestViewLoggedState();
}

class _RequestViewLoggedState extends State<RequestViewLogged> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Solicitudes',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        widget.myRequests.isEmpty
            ? const SizedBox()
            : ButtonFilterForType(
                pageController: pageController,
              ),
        widget.myRequests.isEmpty
            ? const ListEmptyRequest() // ---> Este se muestra si no hay solicitudes
            : Expanded(
                child: ListEmptyNoRequest(
                  // ---> Este se muestra si hay solicitudes echas o no tenemos solicitudes
                  pageController: pageController,
                  myRequests: widget.myRequests,
                  removeRequest: widget.removeRequest,
                  yourRequests: widget.yourRequests,
                ),
              )
      ],
    );
  }
}
