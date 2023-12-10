import 'package:flutter/material.dart';

class BlueBox extends StatelessWidget {
  final double boxHeigh;
  final double circularRadius;
  const BlueBox({super.key, required this.boxHeigh, required this.circularRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF159A9C),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(circularRadius),
          bottomRight: Radius.circular(circularRadius),
        ),
      ),
      width: double.infinity,
      height: boxHeigh,
    );
  }
}