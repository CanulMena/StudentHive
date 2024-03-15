import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/description_house_provider.dart'; //todo: agergar esto al archivo de barril
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseAddDescription extends ConsumerStatefulWidget {
  final PageController pageController;
  const HouseAddDescription({super.key, required this.pageController});

  @override
  ConsumerState<HouseAddDescription> createState() => _HouseAddDescriptionState();
}

class _HouseAddDescriptionState extends ConsumerState<HouseAddDescription> {
  final TextEditingController descriptionController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      isButtonEnabled = descriptionController.text.isNotEmpty;
    });
  }

  void _addListeners() {
    descriptionController.addListener(_checkFields);
  }

  void _removeListeners(){
    descriptionController.removeListener(_checkFields);
  }

  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? clase que se encuentra en el archivo container_title_appbar.dart
              const TitleAppbar(title: 'Describe tu espacio'),
              _message(),
              Container(
                width: size.width * 1,
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                onChanged: (value) {
                  ref.read(descriptionHouseProvider.notifier).setDescription(value);
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
            onNext: () {
            },
            );
        },
      ),
    );
  }

  Widget _message() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: const Text(
        'Detalla qué hace único a tu espacio recuerda describirlo de la mejor manera posible para que los visitantes puedan apreciar completamente.',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
