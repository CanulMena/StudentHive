import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/types_publication/publication_status_false.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/types_publication/publication_status_true.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/my_publications/types_publication/publications_all_tatus.dart';

class MyPublicationView extends ConsumerStatefulWidget {
  const MyPublicationView({super.key});

  @override
  ConsumerState<MyPublicationView> createState() => _MyPublicationViewState();
}

class _MyPublicationViewState extends ConsumerState<MyPublicationView> {
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

    // activesHousesByUser 
    final activeHouses = ref.watch(allActiveHousesPreviewProvider);
    final allPublications = ref.watch(allHousesPreviewProvider);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mis publicaciones'),
        ),
        body: Column(
          children: [
            ButtonFilterStatus( pageController: pageController, ), 
            const SizedBox(height: 10,),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  AllMyPublications(activeHouses: allPublications, ),
                  PublicationStatusTrue( activeHouses: activeHouses, ),
                  PublicationStatusFalse(activeHouses: activeHouses,)
                ],
              ),
            )
          ],
        ));
  }
}

class ButtonFilterStatus extends StatefulWidget {
  final PageController pageController;
  const ButtonFilterStatus({super.key, required this.pageController});

  @override
  State<ButtonFilterStatus> createState() => _ButtonFilterStatusState();
}

class _ButtonFilterStatusState extends State<ButtonFilterStatus> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.05,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                    widget.pageController.jumpToPage(0);
                  });
                },
                child: builContainer(
                    text: 'Todas', index: 0, selectedIndex: _selectedIndex)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                    widget.pageController.jumpToPage(1);
                  });
                },
                child: builContainer(
                    text: 'Aceptadas',
                    index: 1,
                    selectedIndex: _selectedIndex)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                    widget.pageController.jumpToPage(2);
                  });
                },
                child: builContainer(
                    text: 'Rechazadas',
                    index: 2,
                    selectedIndex: _selectedIndex)),
          ],
        ));
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
              ? const Color.fromARGB(255, 198, 197, 197)
              : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      height: size.height * 0.05 * 0.8,
      width: size.width * 0.5 * 0.5,
      child: Text(
        text,
      ),
    );
  }

}
