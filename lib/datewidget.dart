import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datewidget extends StatefulWidget {
  @override
  State<Datewidget> createState() => _DatewidgetState();
}

class _DatewidgetState extends State<Datewidget> {
  String selectDay = "Select Day";

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();

  Map<String, dynamic> informations = {'color': Colors.blue};

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controllerName,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Harajat nomi',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerPrice,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Harajat narxi',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                    initialDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      informations["date"] =
                          DateFormat('yyyy-MM-dd').format(date);
                      selectDay = DateFormat('dd-MM-yyyy').format(date);
                    });
                  }
                },
                child: Text(
                  selectDay,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              ColorPicker(
                color: informations["color"],
                onColorChanged: (Color color) {
                  setState(() {
                    informations["color"] = color;
                  });
                },
                width: 44,
                height: 44,
                borderRadius: 22,
                heading: Text(
                  'Select color',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subheading: Text(
                  'Select color shade',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    String name = _controllerName.text.trim();
                    String price = _controllerPrice.text.trim();

                    if (name.isNotEmpty && price.isNotEmpty) {
                      informations["name"] = name;
                      informations["price"] = price;
                      Navigator.pop(context, informations);
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
