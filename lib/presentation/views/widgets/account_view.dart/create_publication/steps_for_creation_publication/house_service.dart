import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/buttom_steps_creationp.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseService extends StatefulWidget {
  final Function(bool, bool, bool, bool, bool, bool, bool) onNext;
  final PageController pageController;
  const HouseService({super.key, required this.pageController, required this.onNext,});

  @override
  State<HouseService> createState() => _HouseServiceState();
}

class _HouseServiceState extends State<HouseService> {

  bool isWifiAvailable = false;
  bool isKitchenAvailable = false;
  bool isWasherAvailable = false;
  bool isTvAvailable = false;
  bool isAirConditionerAvailable = false;
  bool isWaterAvailable = false;
  bool isGasAvailable = false;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: SingleChildScrollView( 
          child:Column(
            children: [
              const TitleAppbar(title: 'Dale un toque distinto a tu espacio'),

              const SizedBox( height: 20, ),

              SwitchListTileExample(
                iconChanged: Icons.signal_wifi_4_bar,
                text: 'Wifi',
                icon: Icons.signal_wifi_0_bar_outlined, 
                onChanged: (value) { 
                  setState(() {
                    isWifiAvailable = value;
                  });
                },  
              ),

              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.kitchen_outlined, 
                text: 'Cocina',
                iconChanged: Icons.kitchen,
                onChanged: (value) {
                  setState(() {
                    isKitchenAvailable = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.wash_outlined,
                text: 'Lavadora',
                iconChanged: Icons.wash,
                onChanged: (value) {
                  setState(() {
                    isWasherAvailable = value;
                  });
                },
                
              ),

              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.tv,
                text: 'Televisión',
                iconChanged: Icons.tv,
                onChanged: (value) {
                  setState(() {
                    isTvAvailable = value;
                  });
                },
                
              ),

              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.air_outlined,
                text: 'Aire Acondicionado',
                iconChanged: Icons.air,
                onChanged: (value) {
                  setState(() {
                    isAirConditionerAvailable = value;
                  });
                },
                
              ),
              
              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.water_drop_outlined,
                text: 'Agua',
                iconChanged: Icons.water_drop,
                onChanged: (value) {
                  setState(() {
                    isWaterAvailable = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              SwitchListTileExample(
                icon: Icons.gas_meter_outlined,
                text: 'Gas',
                iconChanged: Icons.gas_meter,
                onChanged: (value) {
                  setState(() {
                    isGasAvailable = value;
                  });
                },
              ),

              const SizedBox( height: 15, )

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
            onNext: () {
              widget.onNext(
                isWifiAvailable,
                isKitchenAvailable,
                isWasherAvailable,
                isTvAvailable,
                isAirConditionerAvailable,
                isWaterAvailable,
                isGasAvailable,
              );
            },
            );
        },
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({
    super.key,
    required this.icon,
    required this.text,
    required this.iconChanged, 
    required this.onChanged,
  });
  final IconData icon;
  final String text;
  final IconData iconChanged;
  final Function( bool ) onChanged;

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool _selectOption = false;


  
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
            style: const TextStyle(fontSize: 25),
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
