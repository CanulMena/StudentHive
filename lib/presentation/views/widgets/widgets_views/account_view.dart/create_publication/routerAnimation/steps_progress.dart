import 'package:flutter/material.dart';

class StepProgess extends StatefulWidget {
  final double currentStep;
  final int steps;

  const StepProgess({
    Key? key,
    required this.currentStep,
    required this.steps,
  }) : super(key: key);

  @override
  State<StepProgess> createState() => _StepProgessState();
}

class _StepProgessState extends State<StepProgess> {
  double widhtProgress = 0;

  @override
  void initState() {
    _onSizeWidget();
    super.initState();
  }

  void _onSizeWidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStep) {
      if (context.size is Size) {
        Size size = context.size!;
        widhtProgress = size.width / (widget.steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                '${(widget.currentStep + 1).toInt()} / ${widget.steps.toInt()}'),
          ],
        ),
        Container(
          height: size.height * 0.01,
          width: size.width * 0.9,
          margin: const EdgeInsets.symmetric(vertical: 16),
          // ignore: sort_child_properties_last
          child: Stack(
            children: [
              AnimatedContainer(
                width: widhtProgress * widget.currentStep,
                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
        )
      ],
    );
  }
}
