import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 18),
            SizedBox(width: 4),
            Text(
              "4.7",
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        SizedBox(width: 25),

        Row(
          children: [
            Icon(Icons.delivery_dining, color: Colors.orange, size: 18),
            SizedBox(width: 4),
            Text(
              "Free",
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        SizedBox(width: 25),

        Row(
          children: [
            Icon(Icons.access_time, color: Colors.orange, size: 18),
            SizedBox(width: 4),
            Text(
              "20 min",
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}