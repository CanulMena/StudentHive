import 'package:flutter/material.dart';

class ContainerDetailHouse extends StatelessWidget {
  const ContainerDetailHouse({
    super.key,
    required this.text,
    required this.iconMore,
    required this.iconLess,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String text;
  final IconData iconMore;
  final IconData iconLess;
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.1,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 50),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: Icon(iconLess, size: 25),
              ),
              Text(counter.toString(), style: const TextStyle(fontSize: 20)),
              IconButton(
                onPressed: onIncrement,
                icon: Icon(iconMore, size: 25),
              ),
            ],
          )
        ],
      ),
    );
  }
}
