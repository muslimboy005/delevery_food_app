import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;

  const SearchInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Pizza",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.clear();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}