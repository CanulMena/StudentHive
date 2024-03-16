import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseAddTittle extends ConsumerStatefulWidget {
  final PageController pageController;
  const HouseAddTittle({super.key, required this.pageController});

  @override
  ConsumerState<HouseAddTittle> createState() => _HouseAddTittleState();
}

class _HouseAddTittleState extends ConsumerState<HouseAddTittle> {

  final TextEditingController titleController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      isButtonEnabled = titleController.text.isNotEmpty || ref.read(titleHouseProvider).isNotEmpty;
    });
  }

  void _addListeners() {
    titleController.addListener(_checkFields);
  }

  void _removeListeners(){
    titleController.removeListener(_checkFields);
  }

  @override
  void initState() {
    super.initState();
    titleController.text = ref.read(titleHouseProvider);
    _addListeners();
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 0, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const TitleAppbar(title: 'Dale un nombre a tu espacio'),

              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: const Text(
                  'Opta por títulos breves; no te inquietes, puedes cambiarlo cuando quieras.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),

              Container(
                width: screenSize.width * 1,
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (value) {
                    ref.read(titleHouseProvider.notifier).setTitle(value); // i add the value from the title input to the provider 
                  },
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible 
          ? const SizedBox() 
          : ButtomStepscreateP( 
            pageController: widget.pageController, 
            isButtonEnabled: isButtonEnabled, 
            onNext: () {},
            );
        },
      ),
    );
  }
}
