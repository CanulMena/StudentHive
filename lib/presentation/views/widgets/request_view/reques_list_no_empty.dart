import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/views/widgets/request_view/request_view_guess.dart';

class ListEmptyNoRequest extends StatefulWidget {
  final List<MyRequest> myRequests;
  final Future<void> Function(int) removeRequest;
  // final Size size;

  const ListEmptyNoRequest(
      {super.key,
      required this.myRequests,
      // required this.size,
      required this.removeRequest});

  @override
  State<ListEmptyNoRequest> createState() => _ListEmptyNoRequestState();
}

class _ListEmptyNoRequestState extends State<ListEmptyNoRequest> {
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
    // final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ButtonFilterForType(
          pageController: pageController,
        ),
        RequestViewGuess(
          myRequests: widget.myRequests,
          removeRequest: widget.removeRequest,
        ),
      ],
    );
  }
}

class ButtonFilterForType extends StatefulWidget {
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
