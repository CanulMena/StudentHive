import 'package:flutter/material.dart';

class CustomNavBarButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomNavBarButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(125, 40)),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 199, 198, 198)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
