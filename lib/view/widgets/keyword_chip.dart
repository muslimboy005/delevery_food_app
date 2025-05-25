
import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String text;

  const KeywordChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, color: Colors.black)),
    );
  }
}