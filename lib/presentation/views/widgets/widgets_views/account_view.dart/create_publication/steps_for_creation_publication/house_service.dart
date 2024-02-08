import 'package:flutter/material.dart';
import 'package:studenthive/presentation/views/widgets/widgets_views/account_view.dart/create_publication/utils_for_creation_publication/container_title_appbar.dart';

class HouseService extends StatelessWidget {
  const HouseService({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //? clase que se encuentra en el archivo container_title_appbar.dart
          const TitleAppbar(title: 'Dale un toque distinto a tu espacio'),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(children: const [
              Column(
                children: [
                  SwitchListTileExample(
                    icon: Icons.wifi,
                    text: 'Wifi',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.kitchen,
                    text: 'Cocina',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.wash,
                    text: 'Lavadora',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.tv,
                    text: 'Televisión',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.air_outlined,
                    text: 'Aire Acondicionado',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.water_drop_rounded,
                    text: 'Agua',
                  ),
                  SizedBox(height: 15),
                  SwitchListTileExample(
                    icon: Icons.gas_meter,
                    text: 'Gas',
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample(
      {super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool _selectOption = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color borderColor = Colors.grey;
    Color iconColor = Colors.black;
    if (_selectOption) {
      borderColor = Colors.blue;
      iconColor = Colors.blue;
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
            color: borderColor,
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
            secondary: Icon(widget.icon, size: 45, color: iconColor),
          ),
        ),
      ),
    );
  }
}
