import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HousePrice extends ConsumerStatefulWidget {
  final Function() onNext;
  final PageController pageController;
  const HousePrice({super.key, required this.pageController, required this.onNext});

  @override
  ConsumerState<HousePrice> createState() => _HousePriceState();
}

class _HousePriceState extends ConsumerState<HousePrice> {
  final TextEditingController priceController = TextEditingController();

  bool isButtonEnabled = false;

  void _updateButtonState() {
  setState(() {
    isButtonEnabled = priceController.text.isNotEmpty || ref.read(priceHouseProvider).isNotEmpty;
  });
}

  @override
  void initState() {
    priceController.text = ref.read(priceHouseProvider);
    super.initState();
    priceController.text = ref.read(priceHouseProvider);
    priceController.addListener(_updateButtonState);
    _updateButtonState();
  }

  @override
  void dispose() {
    priceController.removeListener(_updateButtonState);
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAppbar(title: 'Establece un precio para tu espacio'),
              _message(),
              Container(
                width: screenSize.width * 1,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: priceController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (value) {
                    ref.read(priceHouseProvider.notifier).setPrice(value);
                  },
                ),
              ),
              const SizedBox(
                height: 50,
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
                    ref.read(priceHouseProvider.notifier).setPrice(priceController.text);
                    widget.onNext();
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
        'Se puede cambiar caundo tu quieras.',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
