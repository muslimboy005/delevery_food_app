import 'package:deleveryapp/view/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SizeSelection extends StatelessWidget {
  final String selectedSize;
  final Function(String) onSizeChanged;

  const SizeSelection({
    super.key,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SIZE:",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 12),

        Row(
          children: [
            SizeButton(
              size: "10\"",
              isSelected: selectedSize == "10\"",
              onTap: () => onSizeChanged("10\""),
            ),

            SizedBox(width: 15),

            SizeButton(
              size: "14\"",
              isSelected: selectedSize == "14\"",
              onTap: () => onSizeChanged("14\""),
            ),

            SizedBox(width: 15),

            SizeButton(
              size: "16\"",
              isSelected: selectedSize == "16\"",
              onTap: () => onSizeChanged("16\""),
            ),
          ],
        ),
      ],
    );
  }
}