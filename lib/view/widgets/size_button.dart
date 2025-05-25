import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeButton({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
