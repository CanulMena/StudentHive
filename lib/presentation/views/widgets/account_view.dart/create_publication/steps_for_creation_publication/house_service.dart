import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/house_services_provider.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseService extends ConsumerStatefulWidget {
  final PageController pageController;

  const HouseService({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<HouseService> createState() => _HouseServiceState();
}

class _HouseServiceState extends ConsumerState<HouseService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TitleAppbar(title: 'Dale un toque distinto a tu espacio'),
              const SizedBox(
                height: 20,
              ),
              SwitchListTileExample(
                initialOption: ref.read(houseServicesProvider).isWifiAvailable,
                iconChanged: Icons.signal_wifi_4_bar,
                text: 'Wifi',
                icon: Icons.signal_wifi_0_bar_outlined,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setWifiAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption:
                    ref.read(houseServicesProvider).isKitchenAvailable,
                icon: Icons.kitchen_outlined,
                text: 'Cocina',
                iconChanged: Icons.kitchen,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setKitchenAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption:
                    ref.read(houseServicesProvider).isWasherAvailable,
                icon: Icons.wash_outlined,
                text: 'Lavadora',
                iconChanged: Icons.wash,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setWasherAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption: ref.read(houseServicesProvider).isTvAvailable,
                icon: Icons.tv,
                text: 'Televisión',
                iconChanged: Icons.tv,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setTvAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption:
                    ref.read(houseServicesProvider).isAirConditionerAvailable,
                icon: Icons.air_outlined,
                text: 'Aire Acondicionado',
                iconChanged: Icons.air,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setAirConditionerAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption: ref.read(houseServicesProvider).isWaterAvailable,
                icon: Icons.water_drop_outlined,
                text: 'Agua',
                iconChanged: Icons.water_drop,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setWaterAvailable(value);
                },
              ),
              const SizedBox(height: 15),
              SwitchListTileExample(
                initialOption: ref.read(houseServicesProvider).isGasAvailable,
                icon: Icons.gas_meter_outlined,
                text: 'Gas',
                iconChanged: Icons.gas_meter,
                onChanged: (value) {
                  ref
                      .read(houseServicesProvider.notifier)
                      .setGasAvailable(value);
                },
              ),
              const SizedBox(
                height: 15,
              )
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
                  isButtonEnabled: true,
                  onNext: () {},
                );
        },
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  final IconData icon;
  final String text;
  final IconData iconChanged;
  final Function(bool) onChanged;
  final bool initialOption;

  const SwitchListTileExample({
    super.key,
    required this.icon,
    required this.text,
    required this.iconChanged,
    required this.onChanged,
    this.initialOption = false,
  });

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool _selectOption = false;

  @override
  void initState() {
    super.initState();
    _selectOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color iconColor = Colors.grey;
    if (_selectOption) {
      iconColor = Colors.amber;
    }

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(
          color: _selectOption ? Colors.amber : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SwitchListTile(
          activeColor: iconColor,
          title: Text(
            widget.text,
            style: TextStyle(
                fontSize: 25,
                color: _selectOption ? Colors.amber : Colors.grey.shade800),
          ),
          value: _selectOption,
          onChanged: (bool value) {
            setState(() {
              _selectOption = value;
            });
            widget.onChanged(_selectOption);
          },
          secondary: Icon(_selectOption ? widget.iconChanged : widget.icon,
              size: 45, color: iconColor),
        ),
      ),
    );
  }
}
