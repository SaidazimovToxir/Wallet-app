import 'package:flutter/material.dart';
import 'package:lesson_35/dialog_box.dart';

class Feruza extends StatefulWidget {
  double currentAmount;
  Feruza({super.key, required this.currentAmount});

  @override
  State<Feruza> createState() => _HomePageState();
}

class _HomePageState extends State<Feruza> {
  double maxAmount = 10000000;
  TextEditingController _controller = TextEditingController();

  void cancelTask() {
    setState(() {
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void saveTask() {
    setState(() {
      if (_controller.text.isNotEmpty &&
          int.tryParse(_controller.text) != null) {
        if (int.parse(_controller.text) > 0) {
          setState(() {
            maxAmount = double.parse(_controller.text);
          });
        }

        Navigator.of(context).pop();
      } else {}
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 193, 233, 252),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          //sozlar
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Oylik byudjet:",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        //icon
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => DialogBox(
                                  onCancel: cancelTask,
                                  onSave: saveTask,
                                  mycontroller: _controller,
                                ),
                              );
                            });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue.shade600,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "$maxAmount so'm",
                          style: TextStyle(
                            color: Colors.blue.shade600,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                            decorationColor: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${(maxAmount >= widget.currentAmount ? ((widget.currentAmount / maxAmount) * 100).toStringAsFixed(2) : 0)} %",
                      style: const TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),

              // SliderExample
              SliderExample(
                maxAmount: maxAmount,
                currentSliderValue: widget.currentAmount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        max: widget.maxAmount,
        value: widget.maxAmount >= widget.currentSliderValue
            ? widget.currentSliderValue
            : 0,
        onChanged: (value) {},
      ),
    );
  }
}
