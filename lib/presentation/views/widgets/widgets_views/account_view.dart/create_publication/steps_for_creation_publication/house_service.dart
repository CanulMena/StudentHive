import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseService extends StatelessWidget {
  const HouseService({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: const [
        Column(children: [
          //? clase que se encuentra en el archivo container_title_appbar.dart
          TitleAppbar(title: 'Dale un toque distinto a tu espacio'),
          SizedBox(height: 30),
          Column(
            children: [
              SwitchListTileExample(
                iconChanged: Icons.signal_wifi_4_bar,
                text: 'Wifi',
                icon: Icons.signal_wifi_0_bar_outlined,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.kitchen_outlined,
                text: 'Cocina',
                iconChanged: Icons.kitchen,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.wash_outlined,
                text: 'Lavadora',
                iconChanged: Icons.wash,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.tv,
                text: 'Televisión',
                iconChanged: Icons.tv,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.air_outlined,
                text: 'Aire Acondicionado',
                iconChanged: Icons.air,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.water_drop_outlined,
                text: 'Agua',
                iconChanged: Icons.water_drop,
              ),
              SizedBox(height: 15),
              SwitchListTileExample(
                icon: Icons.gas_meter_outlined,
                text: 'Gas',
                iconChanged: Icons.gas_meter,
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({
    super.key,
    required this.icon,
    required this.text,
    required this.iconChanged,
  });
  final IconData icon;
  final String text;
  final IconData iconChanged;

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

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectOption = !_selectOption;
        });
      },
      child: Container(
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
            },
            secondary: Icon(_selectOption ? widget.iconChanged : widget.icon,
                size: 45, color: iconColor),
          ),
        ),
      ),
    );
  }
}
