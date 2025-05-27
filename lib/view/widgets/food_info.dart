import 'package:flutter/material.dart';

class FoodInfo extends StatelessWidget {
  final String text;
  final String labeltext;
  const FoodInfo({
    required this.text,
    required this.labeltext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pizza Calzone European",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 8),

        Text(
          "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
