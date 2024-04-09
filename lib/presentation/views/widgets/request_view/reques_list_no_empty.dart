import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/request_view/reques_view_host.dart';
import 'package:studenthive/presentation/views/widgets/request_view/request_view_guess.dart';

class ListEmptyNoRequest extends StatefulWidget {
  final List<MyRequest> myRequests;
  final List<YourRequest> yourRequests;
  final PageController pageController;
  final Future<void> Function(int) removeRequest;
  final Future<void> Function(int) removeMyRequest;
  final Future<void> Function(int, String, int) evaluateRequest;

  const ListEmptyNoRequest({
    super.key,
    required this.myRequests,
    required this.removeRequest, 
    required this.pageController,
    required this.yourRequests,
    required this.removeMyRequest,
    required this.evaluateRequest,
    });

  @override
  State<ListEmptyNoRequest> createState() => _ListEmptyNoRequestState();
}

class _ListEmptyNoRequestState extends State<ListEmptyNoRequest> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        RequestViewGuess(
          yourRequests: widget.yourRequests,
          removeRequest: widget.removeRequest,
        ),
        RequestViewHost(
          myRequests: widget.myRequests,
          removeMyRequest: widget.removeMyRequest,
          evaluateRequest: widget.evaluateRequest,
        )
      ],
    );
  }
}

class ButtonFilterForType extends StatefulWidget { //* Este es el boton superior para los filtros de mism solicitudes
  final PageController pageController;
  const ButtonFilterForType({super.key, required this.pageController});

  @override
  State<ButtonFilterForType> createState() => _ButtonFilterForTypeState();
}

class _ButtonFilterForTypeState extends State<ButtonFilterForType> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.85,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 156, 134, 21)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selected = 0;
                widget.pageController.jumpToPage(0);
              });
            },
            child: builContainer(
                text: 'Solicitudes Hechas', index: 0, selectedIndex: _selected),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selected = 1;
                widget.pageController.jumpToPage(1);
              });
            },
            child: builContainer(
                text: 'Solicitudes Recibidas',
                index: 1,
                selectedIndex: _selected),
          ),
        ],
      ),
    );
  }

  Widget builContainer({
    required String text,
    required int index,
    required int selectedIndex,
  }) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color.fromARGB(255, 156, 134, 21)
              : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      height: size.height * 0.05 * 0.8,
      width: size.width * 0.5 * 0.8,
      child: Text(text,
          style: TextStyle(
              color: selectedIndex == index
                  ? Colors.white
                  : const Color.fromARGB(255, 156, 134, 21))),
    );
  }
}
