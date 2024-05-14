import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  final maxAmount;
  final currentSliderValue;

  SliderExample(
      {super.key, required this.maxAmount, required this.currentSliderValue});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        activeColor: Colors.blueAccent,
        // inactiveColor: Colors.lightBlue,
        max: widget.maxAmount,
        value: widget.currentSliderValue,
        onChanged: (value) {},
      ),
    );
  }
}
