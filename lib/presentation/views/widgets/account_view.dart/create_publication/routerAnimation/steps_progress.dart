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
  double longProgress = 0;

  @override
  void initState() {
    _onSizeWidget();
    super.initState();
  }

  void _onSizeWidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStep) {
      if (context.size is Size) {
        Size size = context.size!;
        longProgress = size.width / (widget.steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.01,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      width: longProgress * widget.currentStep,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade800,
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
                    ),
                  ],
                ),
              ),
    
            ],
          ),

          const Spacer(),

          Text(
            '${(widget.currentStep + 1).toInt()} / ${widget.steps.toInt()}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54
            ),
          ),

        ],
      ),
    );
  } 


}
