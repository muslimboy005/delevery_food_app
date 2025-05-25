import 'package:flutter/material.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        Text(
          "Uttora Coffe House",
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

