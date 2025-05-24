import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final Widget? suffixIcon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 65,
          child: TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Color(0xFFF3F4F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
