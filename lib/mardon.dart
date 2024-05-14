import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Mardon extends StatefulWidget {
  // List money = [];
  String title;
  Mardon({super.key, required this.title});

  @override
  _MardonState createState() => _MardonState();
}

class _MardonState extends State<Mardon> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(
        () {
          _selectedDate = picked;
        },
      );
    }
  }

  void selectNextMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month + 1, _selectedDate.day);
    });
  }

  void selectPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month - 1, _selectedDate.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    List date = [
      "Yanvar",
      "Fevral",
      "Mart",
      "Aprel",
      "May",
      "Iyun",
      "Iyul",
      "Avgust",
      "Sentyabr",
      "Oktyabr",
      "Noyabr",
      "Dekabr"
    ];
    // List money = [
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    // ];
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text(
            '${date[_selectedDate.month - 1]}, ${_selectedDate.year}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const Gap(20.0),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.grey[300],
                    onTap: () {
                      setState(() {
                        _selectedDate.month - 1;
                        selectPreviousMonth();
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(Icons.arrow_left_outlined),
                    ),
                  ),
                  Text(
                    widget.title,
                    // widget.money[_selectedDate.month - 1] == 0
                    //     ? "Ro'yhat bo'sh"
                    //     : widget.money[_selectedDate.month - 1],
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.grey[300],
                    onTap: () {
                      setState(() {
                        _selectedDate.month + 1;
                        selectNextMonth();
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(Icons.arrow_right_outlined),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
