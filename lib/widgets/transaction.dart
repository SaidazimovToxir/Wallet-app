import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final String title;
  final String date;
  final String price;
  final Color color;
  const Transactions({
    super.key,
    required this.title,
    required this.date,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  ),
                ],
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
          )
        ],
      ),
    );
  }
}
